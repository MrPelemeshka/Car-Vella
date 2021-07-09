import React from "react";
import photo1 from "../../assets/images/mbr-1200x841.jpg";
import photo2 from "../../assets/images/mbr-1200x799.jpg";
import photo3 from "../../assets/images/mbr-3-1200x800.jpg";


class AboutBike extends React.Component {
    render() {
        return (
            <div>
                <section class="amp-lightbox-carousel slider5 cid-sCAtzwZFGA" id="slider5-u">

                    <div class="container">
                        <div class="mbr-pb-4">
                            <h3 class="mbr-fonts-style mbr-section-title mbr-bold align-center mbr-pb-2 display-2">Наши велосипеды</h3>

                        </div>
                        <amp-carousel width="450" height="300" layout="responsive" type="slides" loop="" id="wizard-carouselsCChzTzquU" on="slideChange:AMP.setState({selectedsCChzTzquU: {slide: event.index}})" data-delay="3000">
                            <div class="item slider-image mbr-flex active">
                                <div class="item-wrapper">
                                    <amp-img src={photo1} layout="responsive" width="428.0618311533888" height="300" alt="image" class="placeholder-loader lb-image">

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
                                    <amp-img src={photo2} layout="responsive" width="450.56320400500624" height="300" alt="image" class="placeholder-loader lb-image">

                                        <div placeholder="" class="placeholder">
                                            <div class="mobirise-spinner">
                                                <em></em>
                                                <em></em>
                                                <em></em>
                                            </div></div>

                                    </amp-img>
                                </div>
                            </div><div class="item slider-image mbr-flex">
                                <div class="item-wrapper">
                                    <amp-img src={photo3} layout="responsive" width="450" height="300" alt="image" class="placeholder-loader lb-image">

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

                <section class="content4 mbr-section article cid-sCAtzyaUEd" id="content4-v">



                    <div class="container">
                        <div class="mbr-row mbr-jc-c">
                            <div class="mbr-col-sm-12 mbr-md-12 mbr-col-lg-10">
                                <p class="mbr-text align-center mbr-fonts-style mbr-regular display-5">
                                    Наши велосипеды- это простота и изящество.</p>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="017 mbr-section cid-sCAtzyGckD" id="content17-w">



                    <div class="container mbr-px-5">
                        <div class="mbr-row mbr-jc-c">
                            <div class="card mbr-col-sm-12 mbr-col-md-6 mbr-col-lg-4 md-pb">
                                <h3 class="mbr-section-title mbr-fonts-style align-left mbr-bold mbr-white mbr-pb-2 display-5">Внешний вид</h3>
                                <p class="mbr-text mbr-fonts-style align-left mbr-white mbr-py-1 display-4">
                                    Наши велосипеды никак не выдают себя. Со стороны никто не узнает, что вы едете на арендованном велосипеде.</p>
                            </div>

                            <div class="card mbr-col-sm-12 mbr-col-md-6 mbr-col-lg-4 md-pb">
                                <h3 class="mbr-section-title mbr-fonts-style align-left mbr-bold mbr-white mbr-pb-2 display-5">
                                    Чистота</h3>
                                <p class="mbr-text mbr-fonts-style align-left mbr-white mbr-py-1 display-4">Велосипеды регулярно моют и дезинфицируют.&nbsp;</p>
                            </div>

                            <div class="card mbr-col-sm-12 mbr-col-md-6 mbr-col-lg-4 last-child">
                                <h3 class="mbr-section-title mbr-fonts-style align-left mbr-bold mbr-white mbr-pb-2 display-5">
                                    Надежность</h3>
                                <p class="mbr-text mbr-fonts-style align-left mbr-white mbr-py-1 display-4">Все велосипеды раз в месяц проходят тех. обслуживание. Все велосипеды с дефектами отправляются в ремонт.</p>
                            </div>


                        </div>
                    </div>
                </section>
            </div>
        );
    }
}

export default AboutBike;
