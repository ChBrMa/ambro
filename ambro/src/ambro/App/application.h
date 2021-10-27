#pragma once
#include "ambro.hpp"

namespace amb
{
	class __amb application
	{
	public:
		application();
		virtual ~application();

		auto run() -> void;
	};

	application* create_application();
}

