<?php

namespace App\Controller;

use App\Entity\Article;
use App\Entity\Comment;

use App\Form\ArticleType;
use App\Form\CommentType;

use App\Repository\ArticleRepository;

use Doctrine\Common\Persistence\ObjectManager;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


class BlogController extends AbstractController
{
    /**
     * @Route("", name="page_accueil")
     */
    public function index()
    {
        //$repo sert a discuter avec doctrine et le repository 
        //afin de pouvoir utiliser les article de la BDD.


        return $this->render('blog/index.html.twig', [
            'controller_name' => 'BlogController'
        ]);
    }

    /**
     * @Route("/blog ", name="blog")
     */

    public function blog()
    {
        // Je demande a parler a doctrine, puis je demande a parler au repository, et je lui demande
        //la table des articles.

        $repo = $this->getDoctrine()->getRepository(Article::class);

        //Je lui demande également de me trouver tous les articles en base de données

        $articles = $repo->findAll();

        // J'insère mes articles dans le template home.html.twig ou je peux a présent
        //y faire une boucle for pour afficher tous mes articles.
        
        return $this->render('blog/home.html.twig', [
            'article' => $articles
        ]);
    }

     /**
     * @Route("/blog/{id}", name="blog_show")
     */

    public function show (Article $article, Request $request, ObjectManager $manager)
    {
        // Je crée un nouveeau commentaire 
        $comment = new Comment();
        // Je crée une variable ou je crée un formulaire basé sur l'entité commentType qui prend en paramètre le nouvel objet commentaire
        $form = $this->createForm(CommentType::class, $comment);
        // Je récupère la requete du formulaire $form
        $form->handleRequest($request);

        // Si le formulaire est soumis et valide ...
        if( $form->isSubmitted() && $form->isValid() )
        {
            //on met a jour la date de création et on charge l'article concernée par le commentaire
            $comment->setCreatedAt(new \DateTime())
                    ->setArticle($article);

            //On fait persister le commentaire 
            $manager->persist($comment);

            //On balance en base de donnée 
            $manager->flush();
            
            //On redirige l'utilisateur vers la route "Blog_Show"
            return $this->redirectToRoute('blog_show', [
                'id' => $article->getId()
                ]);
        }

        return $this->render('blog/show.html.twig', [
            'article' => $article,
            'commentForm' => $form->createView()
        ]);
    }

    /**
     * @Route("/new", name="blog_new")
     * @Route("/blog/{id}/edit", name="blog_edit")
     */

    public function create(Article $article = null, Request $request, ObjectManager $manager)
    {
    //gestion des droits de l'utilisateur pour accéder a ces ressources pour l'administration du blog (ONLY ADMIN) !! 
        $this->denyAccessUnlessGranted('ROLE_ADMIN');

    // On créé un objet article a partir de l'entite Article 
        if( !$article )
        {
            $article = new Article();
        }

    //On génère un formulaire a partir du formbuilder ArticleType

        $form = $this->createForm(ArticleType::class, $article);

    //On récupère la requete

        $form->handleRequest($request);

    // On verifie que le formulaire a été soumis et qu'il est valide

        if( $form->isSubmitted() && $form->isValid())
        {
            // Si il est soumis, alors on ajoute une date de création 
            if(!$article->getId())
            {
                $article->setCreatedAt(new \DateTime());
            }
            
            //On fait persister l'article 
            $manager->persist($article);

            //On balance en base de donnée 
            $manager->flush();
            
            //On redirige vers la page des article 'Home'
            return $this->redirectToRoute('blog', ['id' => $article->getId()]);
        }

        return $this->render('blog/blog_new_article.html.twig', [
            'formArticle' => $form->createView(),
            'editMode' => $article->getId() !== null
        ]);
    }
    
    /**
 * @Route("/comment/remove/{id}", name="comment_delete")
 * 
 */
public function delete($id)
{
    $entityManager = $this->getDoctrine()->getManager();
    $com = $entityManager->getRepository(Comment::class)->find($id);
    
    $entityManager->remove($com);

    $entityManager->flush();

    return $this->redirectToRoute('blog');
}

}
