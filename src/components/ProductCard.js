import React from 'react';
import '../style/card.css';
import { Row, Col, } from 'react-bootstrap';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';



const ProductCard = ({ products, onAdd, prodOnSearch }) => {


    const getProdOnSearch = products.filter(x =>
        x.name.toLowerCase().includes(prodOnSearch.toLowerCase())
    )

    const notifyAdded = () => {
        toast.success('Added to Cart!', {
            position: "top-right",
            autoClose: 1000,
            hideProgressBar: false,
            closeOnClick: true,
            pauseOnHover: false,
            draggable: true,
            progress: undefined,
            theme: "colored",
        });
    }

    const notifyNotFound = () => {
        toast.error('Item Not Found!', {
            position: "top-center",
            autoClose: 1000,
            hideProgressBar: false,
            closeOnClick: true,
            pauseOnHover: true,
            draggable: true,
            progress: undefined,
            theme: "colored",
        });
    }


    return (
        <Row>
            {
                prodOnSearch === '' ?
                    products.map(item => (
                        <Col style={{ padding: '50px' }}>
                            <div className="product-card">
                                <img className="product-image" src={item.imagePath} />
                                <h3 className="product-name overflow-wrap"
                                >{item.name}
                                </h3>

                                <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                                    <p className="product-price" style={{ textDecorationLine: 'line-through' }}>
                                        ${item.price}
                                    </p>
                                    <p className="product-price" style={{ color: 'red' }}>
                                        ${parseFloat(item.price - (item.price * item.sale / 100)).toFixed(2)}
                                    </p>
                                </div>

                                <button className="add-to-cart" onClick={() => {
                                    onAdd(item)
                                    notifyAdded()
                                }}>
                                    Add to Cart
                                </button>
                                <ToastContainer
                                    position="top-right"
                                    autoClose={5000}
                                    hideProgressBar={false}
                                    newestOnTop={false}
                                    closeOnClick
                                    rtl={false}
                                    pauseOnFocusLoss
                                    draggable
                                    pauseOnHover
                                    theme="colored"
                                />
                            </div>
                        </Col>

                    )) :
                    (
                        getProdOnSearch.length > 0 ?
                            getProdOnSearch.map(productsFound =>
                                <Col style={{ paddingLeft: '25px' }}>
                                    <div className="product-card">
                                        <img className="product-image" src={productsFound.imagePath} />
                                        <h3 className="product-name overflow-wrap">{productsFound.name}</h3>
                                        <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                                            <p className="product-price" style={{ textDecorationLine: 'line-through' }}>
                                                ${productsFound.price}
                                            </p>
                                            <p className="product-price" style={{ color: 'red' }}>
                                                ${parseFloat(productsFound.price - (productsFound.price * productsFound.sale / 100)).toFixed(2)}
                                            </p>
                                        </div>
                                        <button className="add-to-cart" onClick={() => onAdd(productsFound)}>
                                            Add to Cart
                                        </button>
                                    </div>
                                </Col>
                            )
                            :
                            <div className='not-found-img'>
                                <img src="https://o.remove.bg/downloads/b9160591-387c-4e3c-9864-eac05b9c5b78/153-1533013_sorry-no-results-found-removebg-preview.png" alt="" />
                            </div>
                    )

            }
        </Row>
    );
};

export default ProductCard;