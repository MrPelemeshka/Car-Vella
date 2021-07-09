import React from "react";
import { NavLink } from "react-router-dom";

class MainTitle extends React.Component {
  render() {
    return (
      <section className="header1 cid-sCA3zHIEcq mbr-fullscreen" id="header1-2">
        <div className="container">
          <h1 className="mbr-section-title mbr-fonts-style align-right mbr-bold mbr-white mbr-pb-2 display-1">
            Кар и велошеринг
          </h1>
          <h3 className="mbr-section-subtitle mbr-fonts-style align-right mbr-white mbr-semibold mbr-pb-3 display-5">
            Удобства, которые позволят вам избежать задержек в пути!
          </h3>
          <div className="mbr-section-btn align-right">
            <NavLink to="/Aboutus" className="btn btn-md btn-white display-4" href="aboutus.html">
              О нас
            </NavLink>
          </div>
        </div>
      </section>
    );
  }
}

export default MainTitle;
