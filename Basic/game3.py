#โปรแกรมคำนวนราคาสินค้าแบบมีโปรโมชั่น
print("สินค้า ราคา 50 บาท หากซื้อสินค้า มากกว่า 10 ชิ้นขึ้นไป ลด 10% ")
product_unit = int(input("กรุณากรอกจำนวนสินค้าที่ต้องการซื้อ : "))
product_price = 50
product_promotion = int(product_price)-int(product_price/10)

if product_unit <= 0:
    print("กรุณากรอกจำนวนให้ถูกต้อง")
elif product_unit <= 10:
    print(f"คุณไม่ได้รับสิทธิ์โปรโมชั่น กรุณาชำระสินค้า ยอดชำระ = {product_unit*product_price} บาท")
elif product_unit >= 10:
    print(f"คุณได้รับสิทธิ์โปรโมชั่น กรุณาชำระสินค้า ยอดชำระ = {product_unit*product_promotion} บาท")
else:
    print("Error.")