#include <SFML/Graphics.hpp>
#include <iostream>

#define WIDTH  <++>
#define HEIGHT <++>

inline float getFPS(const sf::Time &time) { return 1000000.0f / time.asMicroseconds(); }

int main()
{
	sf::ContextSettings settings;
	settings.antialiasingLevel = 4;
	sf::RenderWindow window(sf::VideoMode(WIDTH, HEIGHT),
							"<++>",
							sf::Style::Close | sf::Style::Titlebar,
							settings);
	window.setVerticalSyncEnabled(true);
	window.setPosition(sf::Vector2i((1920 - WIDTH) / 2 - 15, (1080 - HEIGHT) / 2 - 24));

	sf::Font roboto;
	sf::Text FPS;

	if(!roboto.loadFromFile("/usr/share/fonts/truetype/roboto/unhinted/"
							"RobotoCondensed-Regular.ttf"))
		std::cerr << "Error while loading font from file\n";

	FPS.setFont(roboto);
	FPS.setCharacterSize(14);
	FPS.setFillColor(sf::Color::Cyan);

	sf::Clock fps_clock;

	while(window.isOpen())
	{
		window.clear();
		sf::Event event;
		while(window.pollEvent(event))
		{
			if(event.type == sf::Event::Closed)
				window.close();
			if(event.type == sf::Event::KeyPressed)
			{
				switch(event.key.code)
				{
					case sf::Keyboard::Key::Q: window.close(); break;
				}
			}
		}

		int fps = static_cast<int>(getFPS(fps_clock.restart()) + 0.45f);
		FPS.setString("FPS : " + std::to_string(fps));

		window.draw(FPS);
		window.display();
	}

	return 0;
}

