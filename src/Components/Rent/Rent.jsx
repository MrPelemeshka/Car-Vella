import React from 'react';
import CarImg from '../../assets/images/mbr-2-1076x717.jpeg';
import Car2Img from '../../assets/images/mbr-1076x673.jpeg';
import { NavLink } from 'react-router-dom';

class Rent extends React.Component{
    constructor(props){
        super(props);
    }
    render(){
        return(
           
            <section>

                    <section className="header1 cid-sCAf69OJXI mbr-fullscreen" id="header1-j">

                        

                        <div className="container">
                            <h1 className="mbr-section-title mbr-fonts-style align-right mbr-bold mbr-white mbr-pb-2 display-1">Каршеринг</h1>
                            
                            <p className="mbr-fonts-style mbr-text align-right mbr-pb-3 mbr-white display-4">&nbsp;- быстрой способ с комфортом<br/>
                             добраться до любой точки города за<br/> небольшое количество времени.</p>
                        </div>

                    </section>

                    <section className="features10 cid-sCAfb1srCo" id="features10-k">

                        <div  className=" container">
                            <div className="mbr-row mbr-jc-c">
                                <div className="image-block mbr-col-sm-12 mbr-col-md-12 mbr-col-lg-6 ">
                                    <amp-img src={CarImg} layout="responsive" width="537.9893164556962" height="406.062" alt="Mobirise" className="mobirise-loader">
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
                                    <h3 className="mbr-section-title mbr-fonts-style align-left mbr-bold mbr-pb-2 display-2">Поездка мечты</h3>
                                    <p className="mbr-fonts-style mbr-text align-left mbr-pt-1 mbr-pb-3 display-7">
                                    Отправляйтесь к вашей точки назначения с комфортом на наших прекрасных автомобилях бизнес класса. 
                                    </p>
                                    <div className="mbr-section-btn align-left"><NavLink className="btn btn-md btn-primary display-4" to="/RentCar">Арендовать</NavLink></div>
                                </div>
                            </div>
                        </div></div>
                    </section>

                    <section className="header1 cid-sCAfc2jLdR mbr-fullscreen" id="header1-l">
                        <div className="container">
                            <h1 className="mbr-section-title mbr-fonts-style align-right mbr-bold mbr-white mbr-pb-2 display-1">
                                Велошеринг</h1>
                            
                            <p className="mbr-fonts-style mbr-text align-right mbr-pb-3 mbr-white display-4">&nbsp;- прекрасная возможность прокатится<br/>
                             с ветерком  по красивым паркам и улицам города.</p>  
                        </div>
                    </section>
                    <section className="features10 cid-sCAfEJuWy2" id="features10-m">    
                        <div className="container">
                            <div className="mbr-row mbr-jc-c">
                                <div className="image-block mbr-col-sm-12 mbr-col-md-12 mbr-col-lg-6 ">
                                    <amp-img src={Car2Img} layout="responsive" width="537.9942116244412" 
                                    height="505.594" alt="Mobirise" className="mobirise-loader">
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
                                        Велопрогулка
                                    </h3>
                                    <p className="mbr-fonts-style mbr-text align-left mbr-pt-1 mbr-pb-3 display-7">
                                    Скорость, ветер в лицо, виды вокруг и это всё не напрягаясь! Конечно, ведь вы можете арендовать наш прекрасный электровелосипед!
                                    </p>
                                    <div className="mbr-section-btn align-left"><NavLink className="btn btn-md btn-primary display-4" to="/RentVelo">Арендовать</NavLink></div>
                                </div>
                            </div>
                        </div></div>
                    </section>

            </section>

        );
    }
}
export default Rent;