import React from "react";
import photo1 from '../../assets/images/mbr-80x80.png'
import { NavLink } from 'react-router-dom';

class Header extends React.Component {
  render() {
    return (
      <section className="menu horizontal-menu cid-sCzYvvw2kx" id="menu2-0">
        <nav className="navbar navbar-dropdown navbar-expand-lg">
          <div className="menu-container container-fluid">
            <div className="navbar-brand">
              <span className="navbar-logo">
                <amp-img
                  src={photo1}
                  layout="responsive"
                  width={40}
                  height={40}
                  alt="Mobirise"
                  className="mobirise-loader"
                >
                </amp-img>
              </span>
              <p className="brand-name mbr-fonts-style mbr-bold display-4">
                Car&amp;Vella
              </p>
            </div>
            <div
              className="collapse navbar-collapse"
              id="navbarSupportedContent"
            >
              <ul
                className="navbar-nav nav-dropdown"
                data-app-modern-menu="true"
              >
                <li className="nav-item">
                  <NavLink
                    className="nav-link link text-black text-primary display-4"
                    to="/MainTitle"
                    aria-expanded="false"
                  >
                    Главная
                  </NavLink>
                </li>
                <li className="nav-item">
                  <NavLink
                    className="nav-link link text-black text-primary display-4"
                    to="/Rent"
                  >
                    Аренда
                  </NavLink>
                </li>
                <li className="nav-item">
                  <NavLink
                    className="nav-link link text-black text-primary display-4"
                    to="/Auth"
                  >
                    Авторизация
                  </NavLink>
                </li>
                <li className="nav-item">
                  <NavLink to={"../AboutUs/AboutUs"}
                  
                      className="nav-link link text-black text-primary display-4"
                      to="/Aboutus"
                      >
                      О нас

                    
                  </NavLink>
                </li>
                <li className="nav-item">
                  <NavLink
                    className="nav-link link text-black text-primary display-4"
                    to="/Contactus"
                  >
                    Связаться с нами
                    <br />
                    <br />
                  </NavLink>
                </li>
              </ul>
            </div>
            <button on="tap:sidebar.toggle" className="ampstart-btn hamburger">
              <span />
              <span />
              <span />
              <span />
            </button>
          </div>
        </nav>
        { }
      </section>
    );
  }
}

export default Header;
