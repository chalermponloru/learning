# เกมส์สุ่มตัวเลข เพื่อลุ้นแจ็คพ็อต

import random

data = int(input("กรุณากรอกหมายเลข 1 ถึง 10 เพื่อเดาตัวเลขแจ็คพ็อต : "))
jackpot = random.randint(1,10)
if data > 10:
    print("กรุณากรอกหมายเลข 1-10 นะ")
elif jackpot == data:
    print(jackpot)
    print(data)
    print("คุณถูกแจ็คพ็อต")
else:
    print(jackpot)
    print(data)
