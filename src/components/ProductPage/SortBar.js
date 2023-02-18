import React from 'react';

import '../../style/sortbar.css'

import { Nav, NavDropdown, Dropdown } from 'react-bootstrap';
import { useState } from 'react';
import { FaFilter, FaSort, FaSortAlphaDownAlt, FaSortNumericDownAlt, FaSortUp } from 'react-icons/fa';
import { useEffect } from 'react';

export default function SortBar({ onSelect }) {

    const [sortTerm, setSortTerm] = useState('')

    const handleSelect = (event) => {
        if (event === 'default')
            window.parent.location = window.parent.location.href;
        else
            setSortTerm(event)
    }

    useEffect(() => {
        onSelect(sortTerm)
    }, [sortTerm])


    return (
        <Nav className='sort-nav'>
            <NavDropdown
                defaultValue={'default'}
                onSelect={handleSelect}
                title={
                    <div className="nav-drop">
                        <FaFilter></FaFilter>
                    </div>
                }
                id="basic-nav-dropdown">

                <Dropdown.Header>Price</Dropdown.Header>
                <Dropdown.Item eventKey="default">Default</Dropdown.Item >
                <Dropdown.Item eventKey="increase">Price Increasing</Dropdown.Item>
                <Dropdown.Item eventKey="decrease">Price Decreasing</Dropdown.Item>
                <Dropdown.Divider />
                <Dropdown.Header>Brand</Dropdown.Header>
                <Dropdown.Item eventKey="adidas">Adidas</Dropdown.Item>
                <Dropdown.Item eventKey="ducadi">Duca Di</Dropdown.Item>
                <Dropdown.Item eventKey="kate">Kate</Dropdown.Item>
                <Dropdown.Item eventKey="mlb">MLB</Dropdown.Item>
                <Dropdown.Item eventKey="whoau">Whoau</Dropdown.Item>
                <Dropdown.Divider />
                <Dropdown.Header>Category</Dropdown.Header>
                <Dropdown.Item eventKey="men">Men</Dropdown.Item>
                <Dropdown.Item eventKey="women">Women</Dropdown.Item>
                <Dropdown.Item eventKey="unisex">Unisex</Dropdown.Item>
                <Dropdown.Item eventKey="kid">Kid</Dropdown.Item>
            </NavDropdown>
        </Nav>
    )
}