# โปรแกรมจับฉลาก
import random
namelist1 = input("ชื่อคนที่ 1 : ")
namelist2 = input("ชื่อคนที่ 2 : ")
namelist3 = input("ชื่อคนที่ 3 : ")
namelist4 = input("ชื่อคนที่ 4 : ")



namelist = [namelist1,namelist2,namelist3,namelist4]

print(random.choices(namelist))