<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use App\Entity\Category;
use App\Entity\Article;
use App\Entity\Comment;

class ArticleFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        //Creation de 3 fausses categeory.

        $faker = \Faker\Factory::create('en_US');

        for($i = 1 ; $i <= 3 ; $i++){
            $category = new Category();
            $category->setTitle($faker->sentence())
                     ->setDescription($faker->paragraph());

            $manager->persist($category);

            //Créer entre 4 et 6 articles
         
            for($j = 0; $j <= mt_rand(4, 6); $j++)
            {
                $content = '<p>' . join($faker->paragraphs(5), '</p><p>' ) .
                '</p>';

                $article = new Article();
                $article->setTitle($faker->sentence())
                        ->setContent($content)
                        ->setImage($faker->imageUrl())
                        ->setCreatedAt($faker->dateTimeBetween('-6 months'))
                        ->setCategory($category);
    
                $manager->persist($article);

                for($k = 0; $k <= mt_rand(4, 10); $k++){
                    
                    $comment = new Comment();
                    $content = '<p>' . join($faker->paragraphs(1), '<p></br></p>') .
                    '</p>';

                    $days = (new \DateTime())->diff($article->getCreatedAt())->days;

                    $comment->setAuthor($faker->name)
                            ->setContent($content)
                            ->setCreatedAt($faker->dateTimeBetween('-' . $days . 'days'))
                            ->setArticle($article);

                    $manager->persist($comment);
                }
            }
        }

        $manager->flush();
    }
}
