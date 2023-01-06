import React, { useState, useEffect } from "react";
import Cart from "../components/Cart";
import SearchBar from "../components/SearchBar";
import ProductCard from "../components/ProductCard";
import SortBar from "../components/SortBar";
import { FaArrowAltCircleLeft, FaArrowLeft } from "react-icons/fa";
import '../style/products.css'


const cartFromSession = JSON.parse(sessionStorage.getItem('cartItems')) || []
const qtyFromSession = parseInt(sessionStorage.getItem('quantity')) || 0


function Products() {
    const [error, setError] = useState(null);
    const [isLoaded, setIsLoaded] = useState(false);
    const [quantity, setQuantity] = useState(qtyFromSession)
    const [searchResults, setSearchResults] = useState('')
    const [sortKey, setSortKey] = useState('')
    const [cartItems, setCartItems] = useState(cartFromSession)
    const [products, setProducts] = useState([]);

    const oldProducts = []

    useEffect(() => {
        sessionStorage.setItem('cartItems', JSON.stringify(cartItems))
    }, [cartItems])

    useEffect(() => {
        sessionStorage.setItem('quantity', quantity)
    }, [quantity])

    useEffect(() => {
        fetch("http://localhost:3000/server/get_all_prod.php")
            .then(res => res.json())
            .then(
                (result) => {
                    setIsLoaded(true);
                    setProducts(result);
                },
                (error) => {
                    setIsLoaded(true);
                    setError(error);
                    console.log('Error calling API')
                }
            )
    }, [])


    useEffect(() => {
        if (products.length > 0) {
            for (let index = 0; index < products.length; index++) {
                products[index].itemQuantity = 0
                products[index].size = ''
            }
            oldProducts = products
        }
    }, [])

    const getFinalPrice = (item) => {
        return parseInt(parseFloat(item.price - (item.price * item.sale / 100)).toFixed(2))
    }


    //search handle
    const handleSearch = (searchTerm) => {
        // Perform search and set search results
        setSearchResults(searchTerm);
    };

    //sort handle

    const handleSort = (sortTerm) => {
        setSortKey(sortTerm)
    }

    const increaseSort = (a, b) => {
        if (getFinalPrice(a) < getFinalPrice(b))
            return -1
        if (getFinalPrice(a) > getFinalPrice(b))
            return 1
        return 0
    }

    const decreaseSort = (a, b) => {
        if (getFinalPrice(a) < getFinalPrice(b))
            return 1
        if (getFinalPrice(a) > getFinalPrice(b))
            return -1
        return 0
    }


    //Add item to cart or increase item's quantity

    const onAdd = (item) => {
        const exist = cartItems.find(x => x.name === item.name)
        if (exist) {
            setCartItems(cartItems.map(x => x.name === item.name ? {
                ...exist, itemQuantity: exist.itemQuantity + 1
            } : x))
        }
        else {
            setQuantity(quantity + 1)
            setCartItems([...cartItems, { ...item, itemQuantity: 1 }])
        }
    }

    //Decrease item's quantity
    const onDecrease = (item) => {
        const exist = cartItems.find(x => x.name === item.name)
        if (exist.itemQuantity === 1) {
            onRemove(exist)
        }
        else {
            setCartItems(cartItems.map(x => x.name === item.name ? {
                ...exist, itemQuantity: exist.itemQuantity - 1
            } : x))
        }
    }



    //Remove from cart

    const onRemove = (item) => {
        setQuantity(quantity - 1)
        const exist = cartItems.find(x => x.name === item.name)
        if (exist)
            setCartItems(cartItems.filter(x => x.name !== item.name))
    }




    // //Set item's color 

    // const onSetColor = (item, color) => {
    //     const exist = cartItems.find(x => x.name === item.name)
    //     exist.color = color
    //     setCartItems(cartItems.map(x => x.name === item.name ? {
    //         ...exist, color: exist.color
    //     } : x))
    // }

    //Set item's size

    const onSetSize = (item, size) => {
        const exist = cartItems.find(x => x.name === item.name)
        exist.size = size
        setCartItems(cartItems.map(x => x.name === item.name ? {
            ...exist, size: exist.size
        } : x))
    }


    return (
        <div className="product-page">
            <br />
            <button><FaArrowAltCircleLeft></FaArrowAltCircleLeft></button>
            <Cart quantity={quantity} cartItems={cartItems}
                onRemove={onRemove} onAdd={onAdd} onDecrease={onDecrease}
                onSetSize={onSetSize}
            />

            <br />
            <SearchBar onSearch={handleSearch} />
            <SortBar onSelect={handleSort} />
            <div className="product-page-message">
                <h1>We
                    <span class="underlined underline-clip"> Sell</span>
                    <br />
                    Best <span class="underlined underline-mask">Shoes!</span>
                    <br />
                    <span class="underlined underline-overflow"></span></h1>
            </div>

            <br /><br /><br /><br />

            {console.log(oldProducts)}

            {
                sortKey === '' &&
                <ProductCard onAdd={onAdd} products={products} prodOnSearch={searchResults} />
                ||
                sortKey === 'default' &&
                <ProductCard onAdd={onAdd} products={products} prodOnSearch={searchResults} />
            }

            {
                sortKey === 'increase' && products.sort((a, b) => increaseSort(a, b)) &&
                <ProductCard onAdd={onAdd} products={products} prodOnSearch={searchResults} />
                ||
                sortKey === 'decrease' && products.sort((a, b) => decreaseSort(a, b)) &&
                <ProductCard onAdd={onAdd} products={products} prodOnSearch={searchResults} />
            }
        </div>
    )
}

export default Products