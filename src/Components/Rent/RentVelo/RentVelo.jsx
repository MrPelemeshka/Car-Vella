import React from 'react';
import photo1 from "../../../assets/images/mbr-1-1076x717.jpg"
import photo2 from "../../../assets/images/mbr-1076x806.jpg"
import photo3 from "../../../assets/images/mbr-1-1076x718.jpg"
import {NavLink} from 'react-router-dom';

class RentVelo extends React.Component{
    constructor(props){
        super(props);
    }
    render(){
        return(
            <section>
                <section className="features10 cid-sCAJBfQi4N" id="features10-17">
                    <div className="container">
                        <div className="mbr-row mbr-jc-c">
                            <div className="image-block mbr-col-sm-12 mbr-col-md-12 mbr-col-lg-6 ">
                                <amp-img src={photo1} layout="responsive" width="538" height="358.5" alt="Mobirise" className="mobirise-loader">
                                    <div placeholder="" className="placeholder">
                                                <div className="mobirise-spinner">
                                                    <em></em>
                                                    <em></em>
                                                    <em></em>
                                                </div></div>
                                    
                                </amp-img>
                            </div>
                            <div className="mbr-col-sm-12 mbr-col-md-12 mbr-col-lg-6">
                                <div className="text-block mbr-m-auto">
                                <h3 className="mbr-section-title mbr-fonts-style align-left mbr-bold mbr-pb-2 display-2">Детский велосипед</h3>
                                <p className="mbr-fonts-style mbr-text align-left mbr-pt-1 mbr-pb-3 display-7">Велосипед для самых маленьких.<br/>Цена - 5 руб/мин<br/></p>
                                <div className="mbr-section-btn align-left"><NavLink className="btn btn-md btn-primary display-4" to="/RentConfirm">Арендовать</NavLink></div>
                            </div>
                        </div>
                    </div></div>
                    </section>

                    <section className="features10 cid-sCAJBgl2Of" id="features10-18">  
                    <div className="container">
                        <div className="mbr-row mbr-jc-c mbr-row-reverse">
                            <div className="image-block mbr-col-sm-12 mbr-col-md-12 mbr-col-lg-6 ">
                                <amp-img src={photo2} layout="responsive" width="538" height="403" alt="Mobirise" className="mobirise-loader">
                                    <div placeholder="" className="placeholder">
                                                <div className="mobirise-spinner">
                                                    <em></em>
                                                    <em></em>
                                                    <em></em>
                                                </div></div>
                                    
                                </amp-img>
                            </div>
                            <div className="mbr-col-sm-12 mbr-col-md-12 mbr-col-lg-6">
                                <div className="text-block mbr-m-auto">
                                <h3 className="mbr-section-title mbr-fonts-style align-left mbr-bold mbr-pb-2 display-2">
                                    Велосипед взрослый</h3>
                                <p className="mbr-fonts-style mbr-text align-left mbr-pt-1 mbr-pb-3 display-7">Самый обычный прогулочный велосипед.<br/>Цена - 5 руб/мин</p>
                                <div className="mbr-section-btn align-left"><NavLink className="btn btn-md btn-primary display-4" to="/RentConfirm">Арендовать</NavLink></div>
                            </div>
                        </div>
                    </div></div>
                    </section>

                    <section className="features10 cid-sCAJBgZlma" id="features10-19">
                    <div className="container">
                        <div className="mbr-row mbr-jc-c">
                            <div className="image-block mbr-col-sm-12 mbr-col-md-12 mbr-col-lg-6 ">
                                <amp-img src={photo3} layout="responsive" width="538" height="359" alt="Mobirise" className="mobirise-loader">
                                    <div placeholder="" className="placeholder">
                                                <div className="mobirise-spinner">
                                                    <em></em>
                                                    <em></em>
                                                    <em></em>
                                                </div></div>
                                    
                                </amp-img>
                            </div>
                            <div className="mbr-col-sm-12 mbr-col-md-12 mbr-col-lg-6">
                                <div className="text-block mbr-m-auto">
                                <h3 className="mbr-section-title mbr-fonts-style align-left mbr-bold mbr-pb-2 display-2">Электро-велосипед</h3>
                                <p className="mbr-fonts-style mbr-text align-left mbr-pt-1 mbr-pb-3 display-7">Электро-велосипед для беззаботных поездок.<br/>Цена - 6 руб/мин</p>
                                <div className="mbr-section-btn align-left"><NavLink className="btn btn-md btn-primary display-4" to="/RentConfirm">Арендовать</NavLink></div>
                            </div>
                        </div>
                    </div></div>
                    </section>
            </section>
        );
    }
}
export default RentVelo;
