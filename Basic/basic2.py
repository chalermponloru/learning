# กรอกข้อมูลตัวเลข เรียงตามข้อมูล และย้อนกลับข้อมูล

data = []
for number in range(5):
    num = int(input(f"ข้อมูลตัวเลขที่ {number+1}: "))
    data.append(num)

pack1 = sorted(data, reverse=True)
pack2 = sorted(data)

print(pack1)
print(pack2)