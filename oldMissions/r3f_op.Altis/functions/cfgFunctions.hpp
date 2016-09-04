class AdvLog
{
	tag = "AdvLog";

	class ace
	{
		file = "functions\ace"
		class aceCarryOff {};
	};

	class creation
	{
		file = "functions\r3f\creation"
		//class factoryCompleteList {};
		class factoryInit {};
		//class factoryOpen {};
		//class storeListObj {};
	};

	class general
	{
		file="functions\general"
		class detach;
		class globalMessage;
		class setOwner;
		class setDir;
		class globalAddAction;
	}

	class object
	{
		file = "functions\r3f\object"
		class moveObj {};
		class objectInit {};
		class releaseObj {};
	};

	class objectAbility
	{
		file = "functions\r3f\object\ability"
		class canBeTowed {};
		class canTow {};
		class canBeTransported {};
		class canBeTransportedClass {};
		class canMove {};
		class canMoveClass {};
		class canTransport {};
		class getObjectHeritage {};
		class canPush {};
	};

	class towing
	{
		file = "functions\towing"
		class attachTowRopes {};
		class canAttachTowRopes {};
		class canTakeTowRopes {};
		class canPickupTowRopes {};
		class dropTowRopes {};
		class getCornerPoints {};
		class getHitchPoints {};
		class pickupTowRopes {};
		class putAwayTowRopes {};
		class simulateTowing {};
		class takeTowRopes {};
		class towingInit {};
		class towingSpeed {};
		class windTowRope {};
	};

	class transport
	{
		file = "functions\r3f\transport"
		class autoload {};
		class calculateSpace {};
		class loadSelection {};
		class seeCargo {};
		class selected {};
		class transportInit {};
		class unloading {};
	};
};