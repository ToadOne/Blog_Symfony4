<?php

namespace App\Controller;
use App\Entity\User;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class UserController extends AbstractController
{
    /**
     * @Route("/user", name="user_profil")
     */
    public function index()
    {


        return $this->render('user/user_profil.html.twig', [
            'controller_name' => 'UserController',
        ]);
    }
}
