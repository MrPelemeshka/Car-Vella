//import {AuthorisationApi} from '../../Api/Api.js';

//1
const PUSHDATA = "PUSHDATA";

//2
let initialState = {
    data: [
        
    ],
    isFetching: false,
};

//3
const authReducer = (state = initialState, action) => {
    
    switch (action.type) {
        case PUSHDATA:
            return {
                ...state,
                data:[...state.data, action.obj]
               
            };
        default: return state;
    };
};

//4
export const pushAC = (obj) => ({type:PUSHDATA, obj});

//5
export const pushThunk = (obj) =>{
    return(dispatch) =>{
        //Вызов апи
        dispatch(pushAC(obj));
    };
};

export default authReducer;
/*
export const pushThunk = (obj) =>{
    return(dispatch) =>{
        dispatch(pushAC(obj));
    };
};
*/
//... -sperad operator - копирует объект поверхностно

