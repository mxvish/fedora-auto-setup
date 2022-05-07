from tkinter import *
import time

root = Tk()
root.title("Tkinter 15min timer")
root.geometry("250x200")

count = 0

def start():
    global count

    root.withdraw()
    time.sleep(900)
    root.deiconify()

    compliment.configure(text="Nice work! ^ ^")
    count += 1
    totalLabel.configure(text=f'Total: {count} times')

compliment = Label(root, text="")
compliment.grid(row=0, column=0)
totalLabel = Label(root, text=f'Total: {count} times')
totalLabel.grid(row=1, column=0)

Label(root, text="What good will I do from now?").grid(row=2, column=0)
Button(root, text="Start", command=start).grid(row=3, column=0)

root.mainloop()
