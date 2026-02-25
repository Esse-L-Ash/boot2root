import turtle

file = open("./turtle", "r")
lines = file.readlines()
for line in lines:
    line = line.strip()
    if "Avance" in line:
        number_of_steps = [token for token in line.split() if token.isdigit()]
        turtle.forward(int(number_of_steps[0]))
    elif "Tourne gauche" in line:
        number_of_steps = [token for token in line.split() if token.isdigit()]
        turtle.left(int(number_of_steps[0]))
    elif "Tourne droite" in line:
        number_of_steps = [token for token in line.split() if token.isdigit()]
        turtle.right(int(number_of_steps[0]))
    elif "Recule" in line:
        number_of_steps = [token for token in line.split() if token.isdigit()]
        turtle.backward(int(number_of_steps[0]))
turtle.done()
