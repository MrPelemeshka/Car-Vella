import React from "react";
import MainContent from '../MainPage/MainContent/MainContent.jsx';
import MainTitle from '../MainPage//MainTitle/MainTitle.jsx';

import {  Route } from 'react-router';

const MainPage = (props) => {
    return (
        <main>
            <Route path="/MainContent" render={() => <MainContent />} />
            <Route path="/MainTitle" render={() => <MainTitle />} />
        </main>
    );
}

export default MainPage