
def HexEight(inputColor):

    reference= {'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15}
    answer= []

    power= -1
    number= 0
    for index in range(8):

        if(index% 2== 0):
            power= 1
        else:
            power= 0

        number+= reference[inputColor[index]]* 16** power

        if(index== 7):
            answer.append(number/ 255)
            number= 0
        elif(power== 0):
            answer.append(number)
            number= 0

    #print(answer[::-1])
    print(answer)


if __name__ == "__main__":
    inputColor= 'D01C1FFF'
    HexEight(inputColor)