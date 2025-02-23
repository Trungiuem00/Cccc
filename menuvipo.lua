import tkinter as tk
from tkinter import messagebox

def chuc_nang_1():
    messagebox.showinfo("Thông báo", "🔹 Chạy chức năng 1!")

def chuc_nang_2():
    messagebox.showinfo("Thông báo", "🔹 Chạy chức năng 2!")

# Tạo cửa sổ chính
root = tk.Tk()
root.title("Menu Python")
root.geometry("300x200")

# Tạo các nút bấm
btn1 = tk.Button(root, text="Chạy chức năng 1", command=chuc_nang_1)
btn1.pack(pady=10)

btn2 = tk.Button(root, text="Chạy chức năng 2", command=chuc_nang_2)
btn2.pack(pady=10)

btn_exit = tk.Button(root, text="Thoát", command=root.quit)
btn_exit.pack(pady=10)

# Chạy chương trình
root.mainloop()
