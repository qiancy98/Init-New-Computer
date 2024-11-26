import re


def first_line_different(s1: str, s2: str):
    # get the line number of the first different line
    s1_sep = s1.split("\n")
    s2_sep = s2.split("\n")
    for i in range(len(s1_sep)):
        if s1_sep[i] != s2_sep[i]:
            return i
    return -1


def different_only_by_url(s1: str, s2: str):
    # check if two string only different by s2 has url
    s1_sep = s1.split("\n")
    s2_sep = s2.split("\n")
    if len(s1_sep) > len(s2_sep):
        return False
    after_url = 0
    for i in range(len(s1_sep)):
        if s1_sep[i] != s2_sep[i + after_url]:
            if s2_sep[i].startswith("  url"):
                after_url = 1
            else:
                return False
    return True


def get_key(bibEntry: str, key: str):
    if bibEntry == "" or bibEntry.startswith("@PREAMBLE{"):
        return ""
    # get the key case "key"
    if key == "key":
        return bibEntry.split("{", 1)[1].split(",", 1)[0].strip()
    # get the key otherwise
    s_sep = bibEntry.split("\n", 1)[1].split("},\n")
    for i in s_sep:
        i = i.strip()
        if i.lower().startswith(key):
            return re.sub("\s+", " ", i.split("{", 1)[1].strip())
    return ""


def string_formulate(s: str, *, drop_bracket: bool = True):
    # replace: \l -> l, \L -> L, \o -> o, \O -> O, \i -> i, \j -> j, \ss -> ss, \SS -> SS, \ae -> ae, \AE -> AE, \oe -> oe, \OE -> OE, \aa -> aa, \AA -> AA
    s = re.sub(r"""\\([lLoOij]|ss|SS|[ao]e|[AO]E|aa|AA)\s*""", r"\1", s)
    # drop all commands
    s = re.sub(r"""\\([a-zA-Z]+|[`"'^~=.]{1})\s*""", "", s)
    # check that i has no character \
    assert "\\" not in s
    if drop_bracket:
        # drop all {}
        s = re.sub(r"""[{}]""", "", s)
        # replace ~ with " "
        s = re.sub(r"""~""", " ", s)
    else:
        # replace " " in {} with ~ to avoid been split
        bracket = 0
        for j in range(len(s)):
            if s[j] == "{":
                bracket = bracket + 1
            elif s[j] == "}":
                bracket = bracket - 1
            elif s[j] == " " and bracket > 0:
                s = s[:j] + "~" + s[j + 1 :]
    return s


def author_formulate(author: str, *, ignore_command: bool = True, ignore_surname_prediction: bool = False, short_name:bool=False, log=None):
    # formulate the latex string
    s_sep = author.split(" and ")
    s_out = []
    for i in s_sep:
        if ignore_command:
            i_ori = i
            i = string_formulate(i, drop_bracket=False)
        # store it as lastname, firstname
        if "," in i:
            # ignore surname prediction like von, van, de, De
            if ignore_surname_prediction:
                surname = i.split(",", 1)[0].strip().split(" ", 1)
                if len(surname) > 1 and surname[0].lower() in ["von", "van", "de"]:
                    if log:
                        print(f"Warning: name '{i}' may not process correctly.", file=log)
                    i = f"{surname[1]} {i}"
        else:
            i = ", ".join(i.rsplit(" ", 1)[::-1])
        if ignore_command:
            i = string_formulate(i, drop_bracket=True)
        s_out.append(i)
    if not short_name:
        return " and ".join(s_out)
    elif len(s_out) == 1:
        return s_out[0].split(",")[0].replace(" ", "")[:3]
    else:
        return "".join([i[0] for i in s_out])


def sortkey_author_year_key(bibEntry: str):
    # formulate the latex string by author_year_key
    s = " + ".join(
        [
            author_formulate(
                get_key(bibEntry, "author") or get_key(bibEntry, "editor"), log=log, ignore_surname_prediction=True
            ),
            get_key(bibEntry, "year"),
            get_key(bibEntry, "key"),
        ]
    )
    # print(s, file=log)
    return s


def new_key(bibEntry: str, log=None):
    # formulate the latex string by author(short)-year(short)
    s = "".join(
        [
            author_formulate(
                get_key(bibEntry, "author") or get_key(bibEntry, "editor"), log=log, ignore_surname_prediction=True, short_name=True
            ),
            get_key(bibEntry, "year")[-2:],
        ]
    )
    if s != get_key(bibEntry, "key"):
        print(f"Info: '{get_key(bibEntry, 'key')}' -> {s}", file=log)
    return s


from sys import argv

assert len(argv) >= 2, "Usage: python sort-bib.py input.bib [output.bib] [log.log]"
if len(argv) == 2:
    argv.append("sort-bib-out.bib")
    print("Output file name is not given, use default: sort-bib-out.bib")
if len(argv) == 3:
    argv.append("sort-bib.log")
    print("Log file name is not given, use default: sort-bib.log")
# read file
with open(argv[1], "r", encoding="utf-8") as f:
    content: str = f.read()

# replace ` ` and `⁡` with ` `
for i in [" ", "⁡"]:
    content = content.replace(i, " ")

# seperate it by @
contents = content.split("@")
# delete dumplicate
contents_out = [""]
with open(argv[3], "w", encoding="utf-8") as log:
    count = 0
    for i in contents:
        if i != contents_out[-1]:
            line_number = first_line_different(i, contents_out[-1])
            if line_number > 0:
                # check url
                if different_only_by_url(i, contents_out[-1]):
                    contents_out[-1] = i
                    continue
                elif different_only_by_url(contents_out[-1], i):
                    continue
                count += 1
                print(
                    f"""==={count}\n@{i}---{line_number}\n@{contents_out[-1]}""",
                    file=log,
                )
            contents_out.append(i)

    # sort by author
    contents_out.sort(key=sortkey_author_year_key)

    # test if key is desired
    for i in contents_out:
        new_key(i, log=log)

# output it
with open(argv[2], "w", encoding="utf-8") as f:
    f.write("@".join(contents_out))
