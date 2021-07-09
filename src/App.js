import './App.css';
import React from 'react';
import MainContent from './Components/MainPage/MainContent/MainContent.jsx';
import MainTitle from './Components/MainPage/MainTitle/MainTitle.jsx';
import Footer from './Components/Footer/Footer.jsx';
import Header from './Components/Header/Header.jsx';
import AboutUs from './Components/AboutUs/AboutUs.jsx';
import Rent from './Components/Rent/Rent.jsx';
import Auth from './Components/Auth/Auth.jsx';
import ContactUs from './Components/ContactUs/ContactUs';
import RentCar from './Components/Rent/RentCar/RentCar';
import RentVelo from './Components/Rent/RentVelo/RentVelo';
import AboutBike from './Components/AboutBike/AboutBike';
import Manager from './Components/Manager/Manager';
import Admin from './Components/Admin/Admin';
import Reg from './Components/Reg/Reg';
import AboutCar from './Components/AboutCar/AboutCar';
import CurrentRent from './Components/CurrentRent/CurrentRent';
import RentConfirm from './Components/RentConfirm/RentConfirm';
import RentPay from './Components/RentPay/RentPay';
import {  Route } from 'react-router';

class App extends React.Component {
  constructor(props) {
    super(props);

};
  render =() =>{
    return (
      <div className="App">
        <Header />
          <Route path="/MainTitle" render={() => <section> <MainTitle /> <MainContent /></section>} />
          <Route path="/Aboutus" render={() => <AboutUs />} />
          <Route path="/Rent" render={() => <Rent />} />
          <Route path="/Auth" render={() => <Auth />} />
          <Route path="/Contactus" render={() => <ContactUs />} />
          <Route path="/RentCar" render={() => <RentCar />} />
          <Route path="/RentVelo" render={() => <RentVelo />} />
          <Route path="/AboutBike" render={() => <AboutBike />} />
          <Route path="/Manager" render={() => <Manager />} />
          <Route path="/Admin" render={() => <Admin />} />
          <Route path="/Reg" render={() => <Reg />} />
          <Route path="/AboutCar" render={() => <AboutCar />} />
          <Route path="/CurrentRent" render={() => <CurrentRent />} />
          <Route path="/RentConfirm" render={() => <RentConfirm />} />
          <Route path="/RentPay" render={() => <RentPay />} />
        <Footer />
      </div>
  );
  }
}

export default App;

