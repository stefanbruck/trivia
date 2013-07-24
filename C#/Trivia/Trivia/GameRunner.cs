using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using UglyTrivia;

namespace Trivia
{
    using System.Diagnostics;

    public class GameRunner
    {

        private static bool notAWinner;

        public static void Main(String[] args)
        {
            if (args.Count() != 1)
            {
                Console.WriteLine("usage: {0} <seed>", Process.GetCurrentProcess().ProcessName);
                Console.WriteLine("  seed should be integer");
                return;
            }

            Game aGame = new Game();

            aGame.add("Chet");
            aGame.add("Pat");
            aGame.add("Sue");

            int seed = int.Parse(args[0]);
            Random rand = new Random(seed);            

            do
            {

                aGame.roll(rand.Next(5) + 1);

                if (rand.Next(9) == 7)
                {
                    notAWinner = aGame.wrongAnswer();
                }
                else
                {
                    notAWinner = aGame.wasCorrectlyAnswered();
                }



            } while (notAWinner);

        }


    }

}

