import React from "react";
import { NavLink } from "react-router-dom";
import photo1 from '../../../assets/images/mbr-1076x567.jpg'
import photo2 from '../../../assets/images/mbr-1076x743.jpg'

class MainContent extends React.Component {
  render() {
    return (
      <section
        className="features1 mbr-section cid-sCzZ4BgpZc"
        id="features1-1"
      >
        <div className="container">
          <div className="mbr-row mbr-jc-c">
            <div className="card mbr-col-sm-12 mbr-col-md-6">
              <div className="card-wrapper">
                <div className="card-img">
                  <amp-img
                    src={photo1}
                    layout="responsive"
                    width="538"
                    height="283.5"
                    alt="Mobirise"
                    className="mobirise-loader"
                  >
                  </amp-img>
                </div>
                <div className="card-box mbr-pt-4">
                  <h4 className="mbr-section-title mbr-fonts-style mbr-bold display-7">
                    Каршеринг
                  </h4>
                  <p className="mbr-text mbr-fonts-style mbr-pt-1 display-4">
                    Наши автомобили - это идельный способ быстро добраться из
                    одной точки в другую.
                  </p>
                  <p className="link mbr-fonts-style mbr-bold mbr-pt-2 display-4">
                    <NavLink to="/AboutCar" className="text-primary">
                      <span className="mbr-iconfont mobi-mbri-right mobi-mbri">
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 24 24"
                          fill="currentColor"
                          width="100%"
                          height="100%"
                        >
                          <path d="M24 11l-6.7 6.7-1.4-1.4 4.3-4.3H0v-2h20.2l-4.3-4.3 1.4-1.4L24 11z" />
                        </svg>
                      </span>
                      <NavLink to="/AboutCar" className="text-primary">
                        ПОДРОБНЕЕ
                      </NavLink>
                    </NavLink>
                  </p>
                </div>
              </div>
            </div>
            <div className="card mbr-col-sm-12 mbr-col-md-6 last-child">
              <div className="card-wrapper">
                <div className="card-img">
                  <amp-img
                    src={photo2}
                    layout="responsive"
                    height="371.5"
                    width="538"
                    alt="Mobirise"
                    className="mobirise-loader"
                  >
                  </amp-img>
                </div>
                <div className="card-box mbr-pt-4">
                  <h4 className="mbr-section-title mbr-fonts-style mbr-bold display-7">
                    Велошеринг
                  </h4>
                  <p className="mbr-text mbr-fonts-style mbr-pt-1 display-4">
                    Велосипед - это возможность увидеть город и насладится
                    свежим воздухом. Также, поездка на велосипеде, это полезная
                    физическая нагрузка.
                  </p>
                  <p className="link mbr-fonts-style mbr-bold mbr-pt-2 display-4">
                    <NavLink to="/AboutBike" className="text-primary" href="aboutbike.html">
                      <span className="mbr-iconfont mobi-mbri-right mobi-mbri">
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 24 24"
                          fill="currentColor"
                          width="100%"
                          height="100%"
                        >
                          <path d="M24 11l-6.7 6.7-1.4-1.4 4.3-4.3H0v-2h20.2l-4.3-4.3 1.4-1.4L24 11z" />
                        </svg>
                      </span>
                    </NavLink>
                    <NavLink to="/AboutBike" className="text-primary">
                      ПОДРОБНЕЕ
                    </NavLink>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    );
  }
}

export default MainContent;
