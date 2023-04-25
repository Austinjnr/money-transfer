import { Button } from "./Button";
import './HeroSection.css';

function HeroSection() {
    return ( 
        <div className="hero-container">
           {/* <img src="https://bit.ly/440b5Gp" alt="lamdingpg" className="img-fluid"/> */}
            <p>A Cutting-Edge Web Application Designed to Revolutionize 
                your Personal and Business Financial Management.</p>
                <div className="hero-btns">
                    <Button className="btn" buttonStyle='btn--primary' buttonSize='btn--large'>
                        GET STARTED <i className="fa-solid fa-right-to-bracket"></i>
                    </Button>
                </div>
        </div>
     );
}

export default HeroSection;