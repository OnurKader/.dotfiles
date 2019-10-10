#define OLC_PGE_APPLICATION
#include <olcPGE/olcPixelGameEngine.h>

class <++> : public olc::PixelGameEngine
{
	public:
		<++>(){
			sAppName = "<++>";
		}
		bool OnUserCreate() override
		{
			<++>
			return true;
		}

		bool OnUserUpdate(float fElapsedTime) override
		{
			<++>
			return true;
		}
};

int main(){
	<++> Demo;
	if(Demo.Construct(<++>, <++>, <++>, <++>))
		Demo.Start();
	return 0;
}





