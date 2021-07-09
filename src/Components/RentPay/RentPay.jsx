import React from "react";
import photo1 from "../../assets/images/mbr-1456x791.png"
import {NavLink} from 'react-router-dom';

class RentPay extends React.Component {
    render() {
        return (
            <section class="header2 cid-sCASi2rAA0" id="header2-1l" data-component="rentpay">
                <div class="container">
                    <div class="mbr-row mbr-jc-c">
                        <div class="mbr-col-lg-8 mbr-col-sm-12 mbr-col-md-12 mbr-flex mbr-column">
                            <h1 class="mbr-fonts-style align-center mbr-bold mbr-pb-2 mbr-section-title display-1">
                                Название арендуемого транспорта</h1>
                            <h3 class="mbr-section-subtitle mbr-fonts-style align-center mbr-semibold mbr-pb-3 display-5">
                                Время</h3>
                            <div class="mbr-text align-center">
                                <p class="mbr-text mbr-fonts-style mbr-pb-3 display-4">Цена</p>
                            </div>
                            <div class="mbr-section-btn align-center"><NavLink class="btn btn-md btn-primary display-4" to="/MainTitle">Закончить аренду</NavLink></div>
                            <div class="mbr-pt-4">
                                <amp-img src={photo1} alt="Mobirise" width="728" height="395.5" layout="responsive" class="mobirise-loader mbr-m-auto align-center">
                                    <div placeholder="" class="placeholder">
                                        <div class="mobirise-spinner">
                                            <em></em>
                                            <em></em>
                                            <em></em>
                                        </div></div>

                                </amp-img>
                            </div>
                        </div>
                    </div>
                </div>

            </section>
        )
    }
}
export default RentPay;