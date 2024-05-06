import tkinter as tk
from tkinter import messagebox
import mysql.connector

# Connect to the MySQL database
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="London@2004",
    database="project"
)
mycursor = mydb.cursor()

def fetch_product_details():
    product_id = entry_product_id.get()

    try:
        # Check if product exists
        mycursor.execute("SELECT * FROM Products WHERE ProductID = %s", (product_id,))
        product = mycursor.fetchone()

        if product:
            entry_product_name.config(state="normal")
            entry_description.config(state="normal")
            entry_category.config(state="normal")
            entry_supplier_id.config(state="normal")
            entry_price.config(state="normal")
            entry_quantity_in_stock.config(state="normal")

            entry_product_name.delete(0, tk.END)
            entry_product_name.insert(0, product[1])
            entry_description.delete(0, tk.END)
            entry_description.insert(0, product[2])
            entry_category.delete(0, tk.END)
            entry_category.insert(0, product[3])
            entry_supplier_id.delete(0, tk.END)
            entry_supplier_id.insert(0, product[4])
            entry_price.delete(0, tk.END)
            entry_price.insert(0, product[5])
            entry_quantity_in_stock.delete(0, tk.END)
            entry_quantity_in_stock.insert(0, product[6])

            entry_product_name.config(state="disabled")
            entry_description.config(state="disabled")
            entry_category.config(state="disabled")
            entry_supplier_id.config(state="disabled")
            entry_price.config(state="disabled")
            entry_quantity_in_stock.config(state="disabled")

            entry_sell_product_id.delete(0, tk.END)
            entry_sell_product_id.insert(0, product_id)
        else:
            messagebox.showerror("Error", "Product not found.")

    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error: {err}")

def sell_product():
    product_id = entry_sell_product_id.get()
    quantity_sold = entry_quantity_sold.get()

    try:
        # Check if product exists
        mycursor.execute("SELECT * FROM Products WHERE ProductID = %s", (product_id,))
        product = mycursor.fetchone()

        if product:
            current_quantity = product[6]
            if current_quantity >= int(quantity_sold):
                new_quantity = current_quantity - int(quantity_sold)
                mycursor.execute("UPDATE Products SET QuantityInStock = %s WHERE ProductID = %s", (new_quantity, product_id))
                mydb.commit()
                messagebox.showinfo("Success", f"{quantity_sold} units of {product[1]} sold.")
                entry_quantity_sold.delete(0, tk.END)
                fetch_product_details()  # Refresh product details after selling
            else:
                messagebox.showerror("Error", "Not enough quantity in stock.")
        else:
            messagebox.showerror("Error", "Product not found.")

    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error: {err}")

# Tkinter GUI
root = tk.Tk()
root.title("Billing System")

# Label and Entry for entering Product ID
label_product_id = tk.Label(root, text="Enter Product ID:")
label_product_id.grid(row=0, column=0, padx=10, pady=5, sticky="e")
entry_product_id = tk.Entry(root, width=30)
entry_product_id.grid(row=0, column=1, padx=10, pady=5)
button_fetch_details = tk.Button(root, text="Fetch Details", command=fetch_product_details)
button_fetch_details.grid(row=0, column=2, padx=10, pady=5)

# Labels and Entries for product details
label_product_name = tk.Label(root, text="Product Name:")
label_product_name.grid(row=1, column=0, padx=10, pady=5, sticky="e")
entry_product_name = tk.Entry(root, width=30, state="disabled")
entry_product_name.grid(row=1, column=1, padx=10, pady=5)

label_description = tk.Label(root, text="Description:")
label_description.grid(row=2, column=0, padx=10, pady=5, sticky="e")
entry_description = tk.Entry(root, width=30, state="disabled")
entry_description.grid(row=2, column=1, padx=10, pady=5)

label_category = tk.Label(root, text="Category:")
label_category.grid(row=3, column=0, padx=10, pady=5, sticky="e")
entry_category = tk.Entry(root, width=30, state="disabled")
entry_category.grid(row=3, column=1, padx=10, pady=5)

label_supplier_id = tk.Label(root, text="Supplier ID:")
label_supplier_id.grid(row=4, column=0, padx=10, pady=5, sticky="e")
entry_supplier_id = tk.Entry(root, width=30, state="disabled")
entry_supplier_id.grid(row=4, column=1, padx=10, pady=5)

label_price = tk.Label(root, text="Price:")
label_price.grid(row=5, column=0, padx=10, pady=5, sticky="e")
entry_price = tk.Entry(root, width=30, state="disabled")
entry_price.grid(row=5, column=1, padx=10, pady=5)

label_quantity_in_stock = tk.Label(root, text="Quantity in Stock:")
label_quantity_in_stock.grid(row=6, column=0, padx=10, pady=5, sticky="e")
entry_quantity_in_stock = tk.Entry(root, width=30, state="disabled")
entry_quantity_in_stock.grid(row=6, column=1, padx=10, pady=5)

# Labels and Entries for selling products
label_sell_product_id = tk.Label(root, text="Product ID:")
label_sell_product_id.grid(row=8, column=0, padx=10, pady=5, sticky="e")
entry_sell_product_id = tk.Entry(root, width=30)
entry_sell_product_id.grid(row=8, column=1, padx=10, pady=5)

label_quantity_sold = tk.Label(root, text="Quantity Sold:")
label_quantity_sold.grid(row=9, column=0, padx=10, pady=5, sticky="e")
entry_quantity_sold = tk.Entry(root, width=30)
entry_quantity_sold.grid(row=9, column=1, padx=10, pady=5)

button_sell = tk.Button(root, text="Sell Product", command=sell_product)
button_sell.grid(row=10, column=0, columnspan=2, padx=10, pady=10)

root.mainloop()
