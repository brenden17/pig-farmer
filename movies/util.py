@outputSchema("word:chararray")
def shorten_name(name):
    return name[0:name.find(':')]
