import { applyMiddleware, combineReducers, createStore } from "redux";
import thunkMiddleware from 'redux-thunk';
import appReducer from './Reducers/app-reducer.js';


let reducers = combineReducers({
   appDataReducer: appReducer,
   
});
let store = createStore(reducers, applyMiddleware(thunkMiddleware));

export default store;