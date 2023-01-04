import React from 'react';

import '../style/sortbar.css'

import { Nav, NavDropdown, Dropdown } from 'react-bootstrap';
import { useState } from 'react';
import { FaSort } from 'react-icons/fa';
import { useEffect } from 'react';

export default function SortBar({ onSelect }) {

    const [sortTerm, setSortTerm] = useState('')

    const handleSelect = (event) => {
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
                        <FaSort></FaSort>
                    </div>
                }
                id="basic-nav-dropdown">


                <Dropdown.Item eventKey="default">Default</Dropdown.Item >
                <Dropdown.Item eventKey="increase">Price Increasing</Dropdown.Item>
                <Dropdown.Item eventKey="decrease">Price Decreasing</Dropdown.Item>
            </NavDropdown>
        </Nav>
    )
}