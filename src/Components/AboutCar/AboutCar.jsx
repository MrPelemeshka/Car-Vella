import React from "react";
import photo1 from "../../assets/images/mbr-1200x841.jpg";
import photo2 from "../../assets/images/mbr-1200x799.jpg";
import photo3 from "../../assets/images/mbr-3-1200x800.jpg";


class AboutCar extends React.Component {
    render() {
        return (<div>
            <section class="amp-lightbox-carousel slider5 cid-sCAoH8QhHx" id="slider5-r" data-components="CarsCarousel">
                <div class="container">
                    <div class="mbr-pb-4">
                        <h3 class="mbr-fonts-style mbr-section-title mbr-bold align-center mbr-pb-2 display-2">Наши автомобили</h3>

                    </div>
                    <amp-carousel width="450" height="300" layout="responsive" type="slides" loop="" id="wizard-carouselsCChzBTOe0" on="slideChange:AMP.setState({selectedsCChzBTOe0: {slide: event.index}})" data-delay="3000">
                        <div class="item slider-image mbr-flex">
                            <div class="item-wrapper">
                                <amp-img src="assets/images/mbr-1200x798.jpg" layout="responsive" width="451.12781954887214" height="300" alt="image" class="placeholder-loader lb-image">

                                    <div placeholder="" class="placeholder">
                                        <div class="mobirise-spinner">
                                            <em></em>
                                            <em></em>
                                            <em></em>
                                        </div></div>

                                </amp-img>
                            </div>
                        </div>
                        <div class="item slider-image mbr-flex">
                            <div class="item-wrapper">
                                <amp-img src="assets/images/mbr-2-1200x800.jpg" layout="responsive" width="450" height="300" alt="image" class="placeholder-loader lb-image">

                                    <div placeholder="" class="placeholder">
                                        <div class="mobirise-spinner">
                                            <em></em>
                                            <em></em>
                                            <em></em>
                                        </div></div>

                                </amp-img>
                            </div>
                        </div>
                        <div class="item slider-image mbr-flex">
                            <div class="item-wrapper">
                                <amp-img src="assets/images/mbr-1-1200x800.jpg" layout="responsive" width="450" height="300" alt="image" class="placeholder-loader lb-image">

                                    <div placeholder="" class="placeholder">
                                        <div class="mobirise-spinner">
                                            <em></em>
                                            <em></em>
                                            <em></em>
                                        </div></div>

                                </amp-img>
                            </div>
                        </div>
                    </amp-carousel>


                </div>
            </section>

            <section class="content4 mbr-section article cid-sCAoRWP4tS" id="content4-s" data-components="Advantages">



                <div class="container">
                    <div class="mbr-row mbr-jc-c">
                        <div class="mbr-col-sm-12 mbr-md-12 mbr-col-lg-10">
                            <p class="mbr-text align-center mbr-fonts-style mbr-regular display-5">
                                Наши машины - это иконы красоты и надежности.</p>
                        </div>
                    </div>
                </div>
            </section>

            <section class="017 mbr-section cid-sCAowlYtjb" id="content17-p">



                <div class="container mbr-px-5">
                    <div class="mbr-row mbr-jc-c">
                        <div class="card mbr-col-sm-12 mbr-col-md-6 mbr-col-lg-4 md-pb">
                            <h3 class="mbr-section-title mbr-fonts-style align-left mbr-bold mbr-white mbr-pb-2 display-5">Внешний вид</h3>
                            <p class="mbr-text mbr-fonts-style align-left mbr-white mbr-py-1 display-4">
                                Наши машины никак не выдают себя. Со стороны никто не узнает, что вы едете на арендованной машине.</p>
                        </div>

                        <div class="card mbr-col-sm-12 mbr-col-md-6 mbr-col-lg-4 md-pb">
                            <h3 class="mbr-section-title mbr-fonts-style align-left mbr-bold mbr-white mbr-pb-2 display-5">
                                Чистота</h3>
                            <p class="mbr-text mbr-fonts-style align-left mbr-white mbr-py-1 display-4">Машины регулярно моют, пылесосят и дезинфицируют.&nbsp;</p>
                        </div>

                        <div class="card mbr-col-sm-12 mbr-col-md-6 mbr-col-lg-4 last-child">
                            <h3 class="mbr-section-title mbr-fonts-style align-left mbr-bold mbr-white mbr-pb-2 display-5">
                                Надежность</h3>
                            <p class="mbr-text mbr-fonts-style align-left mbr-white mbr-py-1 display-4">Все автомобили раз в месяц проходят тех. обслуживание. Все машины с дефектами отправляются в ремонт.</p>
                        </div>


                    </div>
                </div>
            </section>
        </div>
        )
    }
}
export default AboutCar;