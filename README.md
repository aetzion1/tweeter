<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/aetzion1/tweeter">
    <img src="app/assets/images/logo.png" alt="Logo" width="90" height="90">
  </a>

  <h3 align="center">Tweeter</h3>

  <p align="center">
    Simple Twitter clone built using Ruby on Rails
    This project is deployed on [Heroku here](https://tweeter-web.herokuapp.com)

    <br />
    <a href="https://github.com/aetzion1/tweeter"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/aetzion1/tweeter">View Demo</a>
    ·
    <a href="https://github.com/aetzion1/tweeter/issues">Report Bug</a>
    ·
    <a href="https://github.com/aetzion1/tweeter/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [RSpec](https://github.com/rspec/rspec-rails)
* [Circle CI](https://circleci.com/)
* [Heroku](https://heroku.com/)

### Strategic Decisions

* Monolith vs Service-Oriented-Architecture
  - Given the nature of the project (simple decison with few features), the decision was made to use a Monolith architecture
  - If we were to design for scale, a SOA would have been utilized, with a Rails API Backend and a React frontend. For scale, GraphQL would have been a preferred method over ReSTful endpoints

<!-- GETTING STARTED -->
## Getting Started

### Versions

- Ruby 3.0.0
- Rails 6.1.3.1
<!-- * System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions -->


To get a local copy up and running follow these simple steps.

### Installation
1. Fork repository
2. Clone the repo fork
   ```sh
   git clone https://github.com/USERNAME/tweeter.git
   ```
3. Run bundle install
  ```sh
   bundle install
   ```
4. Set up the databases 
  ```sh
   rails db:{create,migrate}
   ```
   



<!-- USAGE EXAMPLES -->
## Usage

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/aetzion1/tweeter/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Your Name - adametzion90@gmail.com

Project Link: [https://github.com/aetzion1/tweeter](https://github.com/aetzion1/tweeter)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [Pexels for logo image](https://www.pexels.com/)
* [Img Shields](https://shields.io)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/aetzion1/tweeter.svg?style=for-the-badge
[contributors-url]: https://github.com/aetzion1/tweeter/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/aetzion1/tweeter.svg?style=for-the-badge
[forks-url]: https://github.com/aetzion1/tweeter/network/members
[stars-shield]: https://img.shields.io/github/stars/aetzion1/tweeter.svg?style=for-the-badge
[stars-url]: https://github.com/aetzion1/tweeter/stargazers
[issues-shield]: https://img.shields.io/github/issues/aetzion1/tweeter.svg?style=for-the-badge
[issues-url]: https://github.com/aetzion1/tweeter/issues
[license-shield]: https://img.shields.io/github/license/aetzion1/tweeter.svg?style=for-the-badge
[license-url]: https://github.com/aetzion1/tweeter/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/adametzion

