import React from 'react';
import photo1 from "../../../assets/images/mbr-1076x718.jpg"
import photo2 from "../../../assets/images/mbr-2-720x1080.jpeg"
import photo3 from "../../../assets/images/mbr-1076x604.jpg"
import {NavLink} from 'react-router-dom';

class RentCar extends React.Component{
    constructor(props){
        super(props);
    }
    render(){
        return(
            <section>
                <section className="features10 cid-sCAA8HtfOR" id="features10-13">       
                <div className="container">
                    <div className="mbr-row mbr-jc-c">
                        <div className="image-block mbr-col-sm-12 mbr-col-md-12 mbr-col-lg-6 ">
                            <amp-img src={photo1} layout="responsive" width="538" height="359" alt="Mobirise" className="mobirise-loader">
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
                                BMW M2</h3>
                            <p className="mbr-fonts-style mbr-text align-left mbr-pt-1 mbr-pb-3 display-7">Спортивное купе, выпускаемое мюнхенским автомобильным концерном.&nbsp;<br/>Цена - 3 руб/мин<br/></p>
                            <div className="mbr-section-btn align-left"><NavLink className="btn btn-md btn-primary display-4" to="/RentConfirm">Арендовать</NavLink></div>
                        </div>
                    </div>
                </div></div>
                </section>

                <section className="features10 cid-sCAE38qgyT" id="features10-14">
                <div className="container">
                    <div className="mbr-row mbr-jc-c mbr-row-reverse">
                        <div className="image-block mbr-col-sm-12 mbr-col-md-12 mbr-col-lg-6 ">
                            <amp-img src={photo2}  layout="responsive" width="537.991279620853" height="472.984" alt="Mobirise" className="mobirise-loader">
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
                                AUDI A4</h3>
                            <p className="mbr-fonts-style mbr-text align-left mbr-pt-1 mbr-pb-3 display-7">Среднеразмерный седан премиального класса.<br/>Цена - 3 руб/мин</p>
                            <div className="mbr-section-btn align-left"><NavLink className="btn btn-md btn-primary display-4" to="/RentConfirm">Арендовать</NavLink></div>
                        </div>
                    </div>
                </div>
                </div>
                </section>

                <section className="features10 cid-sCAHodkAfL" id="features10-15">




                
                <div className="container">
                    <div className="mbr-row mbr-jc-c">
                        <div className="image-block mbr-col-sm-12 mbr-col-md-12 mbr-col-lg-6 ">
                            <amp-img src={photo3}  layout="responsive" width="538" height="302" alt="Mobirise" className="mobirise-loader">
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
                            <h3 className="mbr-section-title mbr-fonts-style align-left mbr-bold mbr-pb-2 display-2">Smart Fortwo</h3>
                            <p className="mbr-fonts-style mbr-text align-left mbr-pt-1 mbr-pb-3 display-7">Заднемоторный, заднеприводный, 2-пассажирский хэтчбек-микрокар.<br/>Цена - 3 руб/мин</p>
                            <div className="mbr-section-btn align-left"><NavLink className="btn btn-md btn-primary display-4" to="/RentConfirm">Арендовать</NavLink></div>
                        </div>
                    </div>
                </div></div>
                </section>


            </section>
        );
    }
}
export default RentCar;
