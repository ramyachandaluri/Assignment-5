document.addEventListener('DOMContentLoaded', () => {
    const productsContainer = document.getElementById('box');
    const productModal = new bootstrap.Modal(document.getElementById('productModal'));
    const modalTitle = document.getElementById('modalTitle');
    const modalImage = document.getElementById('modalImage');
    const modalDescription = document.getElementById('modalDescription');
    const modalCategory = document.getElementById('modalCategory');
    const modalBrand = document.getElementById('modalBrand');
    const modalPrice = document.getElementById('modalPrice');
    const modalStock = document.getElementById('modalStock');

    // Simulate product data (in a real app, this would come from an API)
    const products = [
        {
            id: 1,
            title: "Smartphone X",
            description: "A powerful smartphone with a stunning OLED display and advanced camera system. Perfect for photography enthusiasts.",
            price: 75000,
            discountPercentage: 15,
            rating: 4.5,
            stock: 50,
            brand: "TechCorp",
            category: "Electronics",
            thumbnail: "https://i.dummyjson.com/data/products/2/thumbnail.jpg", // Example thumbnail
            images: [
                "https://i.dummyjson.com/data/products/2/1.jpg",
                "https://i.dummyjson.com/data/products/2/2.jpg",
                "https://i.dummyjson.com/data/products/2/3.jpg"
            ]
        },
        {
            id: 2,
            title: "Ergonomic Office Chair",
            description: "Comfortable and supportive chair designed for long hours of work. Features adjustable lumbar support and headrest.",
            price: 12000,
            discountPercentage: 5,
            rating: 4.2,
            stock: 20,
            brand: "ComfySeating",
            category: "Furniture",
            thumbnail: "https://i.dummyjson.com/data/products/20/thumbnail.webp", // Example thumbnail
            images: [
                "https://i.dummyjson.com/data/products/20/1.jpg",
                "https://i.dummyjson.com/data/products/20/2.jpg",
                "https://i.dummyjson.com/data/products/20/3.png"
            ]
        },
        {
            id: 3,
            title: "Wireless Bluetooth Headphones",
            description: "Immersive audio experience with noise-cancelling technology and long battery life. Ideal for travel and daily commute.",
            price: 8000,
            discountPercentage: 10,
            rating: 4.7,
            stock: 100,
            brand: "AudioPro",
            category: "Electronics",
            thumbnail: "https://i.dummyjson.com/data/products/25/thumbnail.jpg", // Example thumbnail
            images: [
                "https://i.dummyjson.com/data/products/25/1.png",
                "https://i.dummyjson.com/data/products/25/2.jpg",
                "https://i.dummyjson.com/data/products/25/3.png"
            ]
        },
        {
            id: 4,
            title: "Smart Watch Elite",
            description: "Track your fitness, receive notifications, and make calls directly from your wrist. Sleek design with multiple sport modes.",
            price: 25000,
            discountPercentage: 8,
            rating: 4.6,
            stock: 30,
            brand: "WristTech",
            category: "Wearables",
            thumbnail: "https://i.dummyjson.com/data/products/35/thumbnail.jpg", // Example thumbnail
            images: [
                "https://i.dummyjson.com/data/products/35/1.jpg",
                "https://i.dummyjson.com/data/products/35/2.jpg",
                "https://i.dummyjson.com/data/products/35/3.jpg"
            ]
        },
         {
            id: 5,
            title: "4K LED TV",
            description: "Stunning 4K resolution with vibrant colors and smart TV features. Bring the cinema experience home.",
            price: 45000,
            discountPercentage: 12,
            rating: 4.8,
            stock: 15,
            brand: "VisionTech",
            category: "Electronics",
            thumbnail: "https://i.dummyjson.com/data/products/18/thumbnail.jpg",
            images: [
                "https://i.dummyjson.com/data/products/18/1.jpg",
                "https://i.dummyjson.com/data/products/18/2.jpg",
                "https://i.dummyjson.com/data/products/18/3.jpg"
            ]
        },
        {
            id: 6,
            title: "Leather Wallet",
            description: "Premium genuine leather wallet with multiple card slots and a coin pocket. Durable and stylish.",
            price: 1500,
            discountPercentage: 0,
            rating: 4.3,
            stock: 200,
            brand: "FineCraft",
            category: "Accessories",
            thumbnail: "https://i.dummyjson.com/data/products/70/thumbnail.jpg",
            images: [
                "https://i.dummyjson.com/data/products/70/1.jpg",
                "https://i.dummyjson.com/data/products/70/2.jpg",
                "https://i.dummyjson.com/data/products/70/3.jpg"
            ]
        },
        {
            id: 7,
            title: "Running Shoes",
            description: "Lightweight and comfortable running shoes with superior cushioning. Perfect for athletes and daily use.",
            price: 4000,
            discountPercentage: 7,
            rating: 4.6,
            stock: 75,
            brand: "SportStride",
            category: "Footwear",
            thumbnail: "https://i.dummyjson.com/data/products/90/thumbnail.jpg",
            images: [
                "https://i.dummyjson.com/data/products/90/1.jpg",
                "https://i.dummyjson.com/data/products/90/2.jpg",
                "https://i.dummyjson.com/data/products/90/3.jpg"
            ]
        },
        {
            id: 8,
            title: "Coffee Maker",
            description: "Automated coffee machine for brewing fresh, aromatic coffee every morning. Easy to clean and operate.",
            price: 6000,
            discountPercentage: 10,
            rating: 4.4,
            stock: 40,
            brand: "MorningBrew",
            category: "Kitchen Appliances",
            thumbnail: "https://i.dummyjson.com/data/products/60/thumbnail.jpg",
            images: [
                "https://i.dummyjson.com/data/products/60/1.jpg",
                "https://i.dummyjson.com/data/products/60/2.jpg",
                "https://i.dummyjson.com/data/products/60/3.jpg"
            ]
        }
    ];

    function createProductCard(product) {
        const colDiv = document.createElement('div');
        colDiv.className = 'col';

        const cardDiv = document.createElement('div');
        cardDiv.className = 'card h-100 shadow-sm';
        cardDiv.style.cursor = 'pointer'; // Indicate clickable card

        const img = document.createElement('img');
        img.src = product.thumbnail;
        img.className = 'card-img-top';
        img.alt = product.title;
        img.style.height = '200px'; // Fixed height for consistent card appearance
        img.style.objectFit = 'cover'; // Cover the area without distortion

        const cardBody = document.createElement('div');
        cardBody.className = 'card-body d-flex flex-column';

        const cardTitle = document.createElement('h5');
        cardTitle.className = 'card-title';
        cardTitle.textContent = product.title;

        const cardText = document.createElement('p');
        cardText.className = 'card-text mb-1';
        cardText.textContent = Brand: ${product.brand};

        const cardPrice = document.createElement('p');
        cardPrice.className = 'card-text fw-bold text-primary fs-5 mt-auto'; // Push price to bottom
        cardPrice.innerHTML = ₹${product.price.toLocaleString('en-IN')};

        cardBody.appendChild(cardTitle);
        cardBody.appendChild(cardText);
        cardBody.appendChild(cardPrice);
        cardDiv.appendChild(img);
        cardDiv.appendChild(cardBody);
        colDiv.appendChild(cardDiv);

        // Add click event to show modal
        cardDiv.addEventListener('click', () => showProductDetails(product));

        return colDiv;
    }

    function showProductDetails(product) {
        modalTitle.textContent = product.title;
        modalImage.src = product.images[0] || product.thumbnail; // Use first image or thumbnail
        modalImage.alt = product.title;
        modalDescription.textContent = product.description;
        modalCategory.textContent = product.category;
        modalBrand.textContent = product.brand;
        modalPrice.textContent = product.price.toLocaleString('en-IN');
        modalStock.textContent = product.stock;

        productModal.show();
    }

    // Populate products
    products.forEach(product => {
        productsContainer.appendChild(createProductCard(product));
    });
});
