import React from "react";

class Reg extends React.Component {
    render() {
        return (
            <section class="contacts2 cid-sCAcwkTQ1y" id="contacts2-g">



                <div class="container">
                    <h2 class="mbr-section-title align-center mbr-fonts-style mbr-white mbr-bold display-2">Регистрация</h2>


                    <div class="mbr-row mbr-jc-c mbr-pt-4">
                        <div class="mbr-col-lg-7 mbr-col-md-10 mbr-col-sm-12">
                            <form class="mbr-form" method="post" target="_top" action-xhr="https://formoid.net/api/amp-form/push" id="myFormcontacts2g" on="submit:myFormcontacts2g.clear;submit-success:AMP.setState({myStatecontacts2g:{formdata11contacts2g:{stateformdata11contacts2g: '', valueformdata11contacts2g: ''}, formdata21contacts2g:{stateformdata21contacts2g: '', valueformdata21contacts2g: ''}, formdata01contacts2g:{stateformdata01contacts2g: '', valueformdata01contacts2g: ''}, formdata31contacts2g:{stateformdata31contacts2g: '', valueformdata31contacts2g: ''}}});submit-error:AMP.setState({myStatecontacts2g:{formdata11contacts2g:{stateformdata11contacts2g: myStatecontacts2g.formdata11contacts2g.valueformdata11contacts2g}, formdata21contacts2g:{stateformdata21contacts2g: myStatecontacts2g.formdata21contacts2g.valueformdata21contacts2g}, formdata01contacts2g:{stateformdata01contacts2g: myStatecontacts2g.formdata01contacts2g.valueformdata01contacts2g}, formdata31contacts2g:{stateformdata31contacts2g: myStatecontacts2g.formdata31contacts2g.valueformdata31contacts2g}}})">
                                <div class="mbr-form-row">
                                    <div submit-success="" class="mbr-col-sm-12 mbr-col-md-12">

                                    </div>
                                    <div submit-error="" class="mbr-col-sm-12 mbr-col-md-12">

                                    </div>
                                </div>
                                <div class="mbr-form-row">
                                    <div class="field mbr-col-sm-12 mbr-col" data-for="form[data][1][1]">
                                        <input type="hidden" name="form[data][0][0]" value="Name" id="form[data][1][0]-contacts2-g" />
                                        <input on="change:AMP.setState({myStatecontacts2g:{formdata11contacts2g:{valueformdata11contacts2g: event.value}}})" class="field-input display-4" type="text" name="form[data][0][1]" data-form-field="Name" placeholder="Имя" required="" id="form[data][1][1]-contacts2-g" />
                                    </div>
                                    <div class="field mbr-col-sm-12 mbr-col" data-for="form[data][2][1]">
                                        <input type="hidden" name="form[data][1][0]" value="Phone" id="form[data][2][0]-contacts2-g" />
                                        <input on="change:AMP.setState({myStatecontacts2g:{formdata21contacts2g:{valueformdata21contacts2g: event.value}}})" class="field-input display-4" type="tel" placeholder="Email" pattern="*" data-form-field="Phone" name="form[data][1][1]" required="" id="form[data][2][1]-contacts2-g" />
                                    </div>
                                    <div class="field mbr-col-sm-12 mbr-col" data-for="form[data][0][1]">
                                        <input type="hidden" name="form[data][2][0]" value="Email" id="form[data][0][0]-contacts2-g" />
                                        <input on="change:AMP.setState({myStatecontacts2g:{formdata01contacts2g:{valueformdata01contacts2g: event.value}}})" class="field-input display-4" type="email" name="form[data][2][1]" data-form-field="Email" placeholder="Пароль" required="" id="form[data][0][1]-contacts2-g" />
                                    </div>
                                    <div class="area field mbr-col-sm-12 mbr-col-md-12 mbr-col-lg-12" data-for="form[data][3][1]">
                                        <input type="hidden" name="form[data][3][0]" value="Message" id="form[data][3][0]-contacts2-g" />
                                        <textarea on="change:AMP.setState({myStatecontacts2g:{formdata31contacts2g:{valueformdata31contacts2g: event.value}}})" class="field-input display-4" name="form[data][3][1]" rows="7" data-form-field="Message" placeholder="Повторите пароль" id="form[data][3][1]-contacts2-g"></textarea>
                                    </div>
                                    <div class="mbr-section-btn mbr-col-sm-12 mbr-col-md-12 mbr-col-lg-12 align-center"><button type="submit" class="btn btn-primary btn-form display-4">Регистрация</button></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        )
    }
}
export default Reg;