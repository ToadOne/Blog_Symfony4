<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegistrationType;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\HttpFoundation\Response;

class SecurityController extends AbstractController
{
    /**
     * @Route("/inscription", name="security_registration")
     */
   public function registration(Request $request, ObjectManager $manager, UserPasswordEncoderInterface $encoder, \Swift_Mailer $mailer)
   {    
        // On crée un objet utilisateur
         $user = new User();
        // On crée un formulaire d'enregistrement sur la base de l'entité RegistrationType et on prend l'objet user en paramètre
         $form = $this->createForm(RegistrationType::class, $user);
        // On récupère la requète 
         $form->handleRequest($request);

        // Si le formulaire est valide ...
         if($form->isSubmitted() && $form->isValid())
         {
            $sendmaillogin= $user->getUsername();
            $sendmailpassword = $user->getPassword();
            // On crée un hash password par le biais de la methode encodePassword 
            $hash = $encoder->encodePassword($user, $user->getPassword());
            // On met a jour le password en le remplaçant par le hash et on met une date de création 
            $user->setPassword($hash)
                 ->setCreatedAt(new \DateTime());
            // On persist les données dans la base
            $manager->persist($user);
            $manager->flush();
            
            // On prépare l'envoie d'un e-mail de confirmation d'inscription 
            $message = (new \Swift_Message('confirmation_inscription'))
                ->setSubject('Confirmation Inscription - CanadianMaple ')
                ->setFrom('juice.of.bom.ber@gmail.com')
                ->setTo($user->getEmail())
                ->setBody(
                    '<html>' .
                    ' <body>' .
                    ' <h1>Bienvenue sur CanadianMaple</h1> ' .
                    ' <p>Votre inscription est désormais terminée et vous pouvez vous connecter a l\'aide de vos identifiants.</p> ' .
                    ' <h4>Vos information de connexion</h4> ' .
                    ' <span>Login : '. $sendmaillogin .'</span><br>' .
                    ' <span>Password : '. $sendmailpassword .'</span><br> ' .
                    '<p>Gardez ces informations de connexion précieusement et ne les divulguez a personne ! </p>' .
                    '<h5> Staff CanadianMaple</h5>' .
                    ' </body>' .
                    '</html>',
                      'text/html');
 
           // On envoie le mail de confirmation 
           $mailer->send($message);
           
           
            // On redirige l'utilisateur vers la page de login
            return $this->redirectToRoute('security_login');
         } 
         
         return $this->render('security/registration.html.twig', [
             'form' => $form->createView()
         ]);
    }

   /**
    * @Route("/connexion", name="security_login")
    */
   public function login()
   {
        return $this->render('security/login.html.twig');
   }

   /**
    * @Route("/deconnexion", name="security_logout")
    */
    public function logout()
    {
        return $this->redirectToRoute('page_accueil');
    }
}


