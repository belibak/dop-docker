#!/usr/bin/python

blacklist = ['pandas', 'lxml', 'boto']

def get_strings(infile):
    strings = []
    with open(infile, 'r') as file:
        for string in file.readlines():
            strings.append(string)
    return strings


def build_file(outfile, blacklist = blacklist):
    lst = get_strings('requirements.txt')
    with open(outfile, 'w') as file:
        for string in lst:
            string1 = string.split('==')[0]
            if string1 in blacklist:
                continue
            else:
                file.write(string)
    file.close()

if __name__ == "__main__":
    build_file('celery_requirements.txt')


