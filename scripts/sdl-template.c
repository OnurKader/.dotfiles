#include <SDL2/SDL.h>
#include <SDL2/SDL2_gfxPrimitives.h>
#include <math.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define WIDTH  (1280U)
#define HEIGHT (720U)

int main(void)
{
	bool quit = false;
	SDL_Point mouse;

	if(SDL_Init(SDL_INIT_VIDEO))
	{
		fprintf(stderr, "Couldn't initialize SDL: %s\n", SDL_GetError());
		exit(1);
	}

	SDL_Window* window = SDL_CreateWindow("Grid Particle System",
										  SDL_WINDOWPOS_UNDEFINED,
										  SDL_WINDOWPOS_UNDEFINED,
										  WIDTH,
										  HEIGHT,
										  SDL_WINDOW_SHOWN | SDL_WINDOW_BORDERLESS);
	if(!window)
	{
		fprintf(stderr, "Couldn't create window: %s\n", SDL_GetError());
		exit(1);
	}

	SDL_Renderer* render = SDL_CreateRenderer(
		window, -1, SDL_RENDERER_PRESENTVSYNC | SDL_RENDERER_ACCELERATED);

	if(!render)
	{
		fprintf(stderr, "Couldn't create renderer: %s\n", SDL_GetError());
		SDL_DestroyWindow(window);
		exit(1);
	}

	while(!quit)
	{
		SDL_Event e;
		while(SDL_PollEvent(&e))
		{
			switch(e.type)
			{
				case SDL_QUIT: quit = true; break;
				case SDL_KEYDOWN:
					switch(e.key.keysym.sym)
					{
						case SDLK_ESCAPE:
						case SDLK_q: quit = true; break;
						default: break;
					}
					break;
				case SDL_MOUSEMOTION: mouse = (SDL_Point){e.motion.x, e.motion.y}; break;
				default: break;
			}
		}

		// Handle WASD / Arrow Keys
		const Uint8* currentKeyStates = SDL_GetKeyboardState(NULL);
		if(currentKeyStates[SDL_SCANCODE_UP])
		{
			printf("UP!\n");
		}
		else if(currentKeyStates[SDL_SCANCODE_DOWN])
		{
			printf("DOWN!\n");
		}
		else if(currentKeyStates[SDL_SCANCODE_LEFT])
		{
			printf("LEFT!\n");
		}
		else if(currentKeyStates[SDL_SCANCODE_RIGHT])
		{
			printf("RIGHT!\n");
		}

		SDL_SetRenderDrawColor(render, 0U, 0U, 0U, 255U);
		SDL_RenderClear(render);

		SDL_RenderPresent(render);
	}

	SDL_DestroyRenderer(render);
	SDL_DestroyWindow(window);
	SDL_Quit();
	return 0;
}
