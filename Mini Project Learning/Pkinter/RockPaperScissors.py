from tkinter import *
import tkinter.messagebox
import random
from PIL import Image, ImageTk

root = Tk()
root.title("เกมส์ เป่า ยิ้ง ฉุบ")
root.iconbitmap(r"D:\Learn\Python\Tkinter\Game\Picture\ICON.ICO")
myMenu = Menu()
root.config(menu=myMenu)

rock_img = ImageTk.PhotoImage(Image.open(r"D:\Learn\Python\Tkinter\Game\Picture\rock.png").resize((80, 80)))
scissors_img = ImageTk.PhotoImage(Image.open(r"D:\Learn\Python\Tkinter\Game\Picture\scissors.png").resize((80, 80)))
paper_img = ImageTk.PhotoImage(Image.open(r"D:\Learn\Python\Tkinter\Game\Picture\paper.png").resize((80, 80)))


def aboutProgram():
    tkinter.messagebox.showinfo("About Me","ผู้พัฒนาโปรแกรม : Chalermpon Lorudomphan")


def fight():
    bot = random.randint(1,3)
    player1 = player.get()
    if player1==3 and bot==2:
        tkinter.messagebox.showinfo("สรุปผลการแข่งขัน","ผู้เล่น ออกค้อน / NPC ออกกรรไกร \n        ผู้เล่น : เป็นผู้ชนะ").grid(row=4,column=3)
    elif player1==3 and bot==1:
        tkinter.messagebox.showinfo("สรุปผลการแข่งขัน","ผู้เล่น ออกค้อน / NPC ออกกระดาษ \n        NPC : เป็นผู้ชนะ").grid(row=4,column=3)
    elif player1==2 and bot==1:
        tkinter.messagebox.showinfo("สรุปผลการแข่งขัน","ผู้เล่น ออกกรรไกร / NPC ออกกระดาษ \n        ผู้เล่น : เป็นผู้ชนะ").grid(row=4,column=3)
    elif player1==2 and bot==3:
        tkinter.messagebox.showinfo("สรุปผลการแข่งขัน","ผู้เล่น ออกกรรไกร / NPC ออกค้อน \n        NPC : เป็นผู้ชนะ").grid(row=4,column=3)
    elif player1==1 and bot==3:
        tkinter.messagebox.showinfo("สรุปผลการแข่งขัน","ผู้เล่น ออกกระดาษ / NPC ออกค้อน \n        ผู้เล่น : เป็นผู้ชนะ").grid(row=4,column=3)
    elif player1==1 and bot==2:
        tkinter.messagebox.showinfo("สรุปผลการแข่งขัน","ผู้เล่น ออกกระดาษ / NPC ออกกรรไกร \n        NPC : เป็นผู้ชนะ").grid(row=4,column=3)
    elif player1 == bot:
        tkinter.messagebox.showinfo("สรุปผลการแข่งขัน","ผู้เล่น กับ NPC ออกเหมือนกัน ผลคือ เสมอกัน").grid(row=4,column=3)


player = IntVar()
player.set(3)
Radiobutton(root,image=rock_img,variable=player,value=3).pack()
Radiobutton(root,image=scissors_img,variable=player,value=2).pack()
Radiobutton(root,image=paper_img,variable=player,value=1).pack()

Button(text="เป่า ยิ้ง ฉุบ",command=fight).pack()


myMenu.add_cascade(label="About",command=aboutProgram)

root.geometry("320x320+800+300")
root.mainloop()