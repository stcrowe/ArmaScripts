class AdvancedConversationSystem
{
	idd = 69;
	movingenable = false;

	onLoad = "uiNamespace setVariable ['ACS', (_this select 0)]";
	onUnload = "[] call ACS_fnc_exitDialog";

	class Controls
	{

		class RscListbox_1500: LT_RscListBox
		{
			idc = 1500;
			x = 0.69 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.272013 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.45};

			sizeEx = 0.038;

			onLBDblClick = "[] spawn ACS_fnc_topicSelected";
		};
		class RscText_1000: LT_RscText
		{
			idc = 1000;
			text = "test";
			x = 0.33 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.0340016 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.45};

			//style = ST_CENTER;
		};

		class RscBackGround : LT_RscBackground
		{
			idc = -1;
			x = 0.33 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.350395 * safezoneW;
			h = 0.2 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.45};
		};

		class My_Controls_Group : LT_RscControlsGroup
		{

			x = 0.33 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.350395 * safezoneW;
			h = 0.2 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.45};

			class HScrollbar
			{
				height = 0;
			};

			class Controls
			{
				class RscText_1001: LT_RscText
				{
					idc = 1001;
					h = 0.05;
					w = 0.33 * safezoneW;
					text = "test_dialogue";
					style = 0x10 + 512;

					//style = ST_MULTI + ST_CENTER + NO_BORDER;
					sizeEx = 0.038;

				};
			};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};