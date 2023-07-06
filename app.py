#!/usr/bin/python3
from models.user import User
from models import storage
from models.category import Category
from models.sub_categories import Sub_Category
from models.products import Product
from flask import Flask, render_template, request, redirect, flash, jsonify
from flask_cors import CORS
import sys
import os
sys.path.append('..')  # Add parent folder to module search path

app = Flask(__name__, template_folder='templates/')
CORS(app)
app.secret_key = os.urandom(24)

# Temporary storage for registered users
users = []


@app.route('/')
def index():
    products = storage.all(Product).values()
    return render_template('index.html', products=products)


@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        phone = request.form['phone']
        address = request.form['address']
        pin = request.form['pin']
        date_of_birth = request.form['date_of_birth']
        password = request.form['password']

        # Create a new User instance with the provided data
        user = User(User_name=username, User_mail=email, User_phone=phone, User_address=address,
                    User_pin=pin, Date_of_birth=date_of_birth, User_pass=password)

        # Add the user to the list of registered users
        storage.new(user)
        storage.save()

        # Redirect to a success page or perform further actions
        return redirect('/success')
    else:
        return render_template('register.html')


@app.route('/success')
def success():
    return "Registration successful!"


@app.route('/submit_product', methods=['GET', 'POST'])
def submit_product():
    # Retrieve form data
    if request.method == 'POST':
        name = request.form['name']
        description = request.form['description']
        cost = float(request.form['cost'])
        price = float(request.form['price'])
        brand = request.form['brand']
        size = request.form['size']
        os = request.form['os']
        dimensions = request.form['dimensions']
        resolution = request.form['resolution']
        warranty = int(request.form['warranty'])
        design = request.form['design']
        sub_cat_id = int(request.form['sub_cat_id'])
        category_id = int(request.form['category_id'])
        image = request.form['image']
        stock = int(request.form['stock'])

        # Saves the product to the database
        product = Product(
            Name=name,
            Description=description,
            Cost=cost,
            Price=price,
            Brand=brand,
            Size=size,
            Os=os,
            Dimensions=dimensions,
            Resolution=resolution,
            Warranty=warranty,
            Design=design,
            Sub_cat_id=sub_cat_id,
            Category_id=category_id,
            Image=image,
            Stock=stock
        )
        storage.new(product)
        storage.save()
        # Displays a success message
        flash('New product created successfully!', 'success')
        return redirect('/success')
    else:
        return render_template('product.html')
        
@app.route('/edit_product/<int:product_id>', methods=['GET', 'POST'])
def edit_product(product_id):
    # Retrieve the product from the database
    product = storage.get(Product, product_id)
    if product is None:
        # Handle case when product is not found
        return "Product not found."

    if request.method == 'POST':
        # Update the product with the new form data
        product.Name = request.form['name']
        product.Description = request.form['description']
        product.Cost = float(request.form['cost'])
        product.Price = float(request.form['price'])
        product.Brand = request.form['brand']
        product.Size = request.form['size']
        product.Os = request.form['os']
        product.Dimensions = request.form['dimensions']
        product.Resolution = request.form['resolution']
        product.Warranty = int(request.form['warranty'])
        product.Design = request.form['design']
        product.Sub_cat_id = int(request.form['sub_cat_id'])
        product.Category_id = int(request.form['category_id'])
        product.Image = request.form['image']
        product.Stock = int(request.form['stock'])

        # Save the updated product to the database
        storage.save()
        flash('New product created successfully!', 'success')
        
        

    return render_template('edit_product.html', product=product)



@app.route('/api/products', methods=['GET'])
def get_products():
    products = storage.all(Product).values()

    # Convert the product objects to a list of dictionaries
    products_list = []
    for product in products:
        product_data = {
            'id': product.id,
            'Name': product.Name,
            'Description': product.Description,
            'Cost': product.Cost,
            'Price': product.Price,
            'Brand': product.Brand,
            'Size': product.Size,
            'Os': product.Os,
            'Dimensions': product.Dimensions,
            'Resolution': product.Resolution,
            'Warranty': product.Warranty,
            'Design': product.Design,
            'Sub_cat_id': product.Sub_cat_id,
            'Category_id': product.Category_id,
            'Image': product.Image,
            'Stock': product.Stock
        }
        products_list.append(product_data)

    return jsonify(products_list)


if __name__ == '__main__':
    app.run(debug=True)
