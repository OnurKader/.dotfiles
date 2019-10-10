#include <SDL2/SDL.h>
#include <iostream>

#define WIDTH	<++> U
#define HEIGHT	<++> U
#define MAX_FPS 60U

int main()
{
	SDL_Init(SDL_INIT_EVERYTHING);

	SDL_Window* window = SDL_CreateWindow("<++>",
										  SDL_WINDOWPOS_UNDEFINED,
										  SDL_WINDOWPOS_UNDEFINED,
										  WIDTH,
										  HEIGHT,
										  SDL_WINDOW_BORDERLESS);

	if(!window)
		std::cerr << "\033[32m;Couldn't Initialize SDL_Window\n\033[m"
				  << SDL_GetError() << '\n';

	SDL_Surface* surface = SDL_GetWindowSurface(window);
	Uint32 WHITE = SDL_MapRGBA(surface->format, 255U, 255U, 255U, 255U),
		   BLACK = SDL_MapRGBA(surface->format, 0U, 0U, 0U, 255U);

	SDL_FillRect(surface, NULL, BLACK);
	SDL_UpdateWindowSurface(window);

	Uint32 start_tick;
	bool running = true;
	while(running)
	{
		start_tick = SDL_GetTicks();
		SDL_Event event;
		while(SDL_PollEvent(&event))
		{
			switch(event.type)
			{
				case SDL_QUIT: running = false; break;
			}
		}

		if(1000 / MAX_FPS > SDL_GetTicks() - start_tick)
		{
			SDL_Delay(1000 / MAX_FPS - (SDL_GetTicks() - start_tick));
		}
	}

	SDL_FreeSurface(surface);
	SDL_DestroyWindow(window);
	SDL_Quit();
	return 0;
}

