import sys

def write():
    print('Creating new text file') 

    name = raw_input('Enter name of text file: ')+'.txt'  # Name of text file coerced with +.txt
    output = open(name, 'a')   # Trying to create a new file or open one
    i = 1
    with open('active_employees.csv', 'r') as f:
        for line in f:
            name=line
            first_last = str.split(name)
            output.write("user" + str(i) + " = User.new\n")
            output.write("user" + str(i) + ".email = '" + first_last[0] + "@" + first_last[1] + ".com'\n")
            output.write("user" + str(i) + ".first_name = '" + first_last[0] + "'\n")
            output.write("user" + str(i) + ".last_name = '" + first_last[1] + "'\n")
            output.write("user" + str(i) + ".password = '12345678'\n")
            output.write("user" + str(i) + ".password_confirmation = '12345678'\n")
            output.write("user" + str(i) + ".save!\n")
            i += 1
    file.close(output)

write()