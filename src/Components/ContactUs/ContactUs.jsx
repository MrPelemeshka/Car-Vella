import React from 'react';
class ContactUs extends React.Component{
    constructor(props){
        super(props)
    }
    render(){
        return(
            <section>
                <section className="contacts2 cid-sCAbU1f1kI" id="contacts2-1g">
                    <div className="container">
                        <h2 className="mbr-section-title align-center mbr-fonts-style mbr-white mbr-bold display-2">Contact Us</h2>
                        <div className="mbr-row mbr-jc-c mbr-pt-4">
                            <div className="mbr-col-lg-7 mbr-col-md-10 mbr-col-sm-12">
                                <form className="mbr-form" method="post" target="_top" action-xhr="https://formoid.net/api/amp-form/push" id="myFormcontacts21g" >
                                    <div className="mbr-form-row">
                                        <div submit-success="" className="mbr-col-sm-12 mbr-col-md-12">
                                            
                                        </div>
                                        <div submit-error="" className="mbr-col-sm-12 mbr-col-md-12">
                                            
                                        </div>
                                    </div>
                                    <div className="mbr-form-row">
                                        <div className="field mbr-col-sm-12 mbr-col" data-for="form[data][1][1]">
                                            <input type="hidden" name="form[data][0][0]" value="Name" id="form[data][1][0]-contacts2-1g"/>
                                            <input   className="field-input display-4" type="text" name="form[data][0][1]" data-form-field="Name" placeholder="Имя" required="" id="form[data][1][1]-contacts2-1g"/>
                                        </div>
                                        
                                        <div className="field mbr-col-sm-12 mbr-col" data-for="form[data][0][1]">
                                            <input type="hidden" name="form[data][1][0]" value="Email" id="form[data][0][0]-contacts2-1g"/>
                                            <input  className="field-input display-4" type="email" name="form[data][1][1]" data-form-field="Email" placeholder="Email" required="" id="form[data][0][1]-contacts2-1g"/>
                                        </div>
                                        <div className="area field mbr-col-sm-12 mbr-col-md-12 mbr-col-lg-12" data-for="form[data][3][1]">
                                            <input type="hidden" name="form[data][2][0]" value="Message" id="form[data][3][0]-contacts2-1g"/>
                                            <textarea   className="field-input display-4" name="form[data][2][1]" rows="7" data-form-field="Message" placeholder="Сообщение" id="form[data][3][1]-contacts2-1g"/>
                                        </div>
                                        <div className="mbr-section-btn mbr-col-sm-12 mbr-col-md-12 mbr-col-lg-12 align-center"><button type="submit" className="btn btn-primary btn-form display-4">Отправить</button></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section> 
            
            </section>
        )
    }
}
export default ContactUs;
