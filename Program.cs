using System;

namespace RockPaperScissors
{
    class Program
    {
        private int GameCount = 0;
        private int Wins = 0;
        private int Losses = 0;
        static void Main(string[] args)
        {
            GetUserInput();
            Console.WriteLine($"The computer played {GenerateRandomOutput()}");
        }

        public enum Option
        {
            rock,
            paper,
            scissors
        }

        static Option GetUserInput() 
        {
            Console.WriteLine("Enter rock, paper, or scissors to play");
            string input = System.Console.ReadLine().ToLower();

            Enum.TryParse(input, out Option option);
            return option;
        }

        static Option GenerateRandomOutput() 
        {
            Random random = new Random();
            int randomInt = random.Next(1, 3);
            string stringOption = null;
            if (randomInt == 0) 
            {
                stringOption = "rock";
            } 
            else if (randomInt == 1) 
            {
                stringOption = "paper";
            } 
            else 
            {
                stringOption = "scissors";
            }
            Enum.TryParse(stringOption, out Option option);

            return option;
        }

        static void WhoWins() 
        {
            
        }
    }
}
