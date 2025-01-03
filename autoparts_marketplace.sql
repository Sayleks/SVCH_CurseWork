PGDMP  +    ;                |            autoparts_marketplace    17.2    17.2 S    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16715    autoparts_marketplace    DATABASE     �   CREATE DATABASE autoparts_marketplace WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
 %   DROP DATABASE autoparts_marketplace;
                     postgres    false            a           1247    16755    enum_Orders_status    TYPE     e   CREATE TYPE public."enum_Orders_status" AS ENUM (
    'pending',
    'completed',
    'cancelled'
);
 '   DROP TYPE public."enum_Orders_status";
       public               postgres    false            U           1247    16717    enum_Users_role    TYPE     O   CREATE TYPE public."enum_Users_role" AS ENUM (
    'client',
    'operator'
);
 $   DROP TYPE public."enum_Users_role";
       public               postgres    false            �            1259    16806 	   Favorites    TABLE     �   CREATE TABLE public."Favorites" (
    id uuid NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    user_id uuid,
    part_id uuid
);
    DROP TABLE public."Favorites";
       public         heap r       postgres    false            �            1259    16821    Inventories    TABLE     !  CREATE TABLE public."Inventories" (
    id uuid NOT NULL,
    quantity integer DEFAULT 0 NOT NULL,
    location character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    part_id uuid,
    supplier_id uuid
);
 !   DROP TABLE public."Inventories";
       public         heap r       postgres    false            �            1259    16774 
   OrderItems    TABLE       CREATE TABLE public."OrderItems" (
    id uuid NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    order_id uuid,
    part_id uuid
);
     DROP TABLE public."OrderItems";
       public         heap r       postgres    false            �            1259    16761    Orders    TABLE     �  CREATE TABLE public."Orders" (
    id uuid NOT NULL,
    status public."enum_Orders_status" DEFAULT 'pending'::public."enum_Orders_status" NOT NULL,
    total_price numeric(10,2) NOT NULL,
    delivery_method character varying(255) NOT NULL,
    address character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    user_id uuid
);
    DROP TABLE public."Orders";
       public         heap r       postgres    false    865    865            �            1259    16741    Parts    TABLE     t  CREATE TABLE public."Parts" (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    compatibility json,
    stock integer DEFAULT 0 NOT NULL,
    image character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    supplier_id uuid
);
    DROP TABLE public."Parts";
       public         heap r       postgres    false            �            1259    16789    Reviews    TABLE     �   CREATE TABLE public."Reviews" (
    id uuid NOT NULL,
    rating integer NOT NULL,
    comment text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    user_id uuid,
    part_id uuid
);
    DROP TABLE public."Reviews";
       public         heap r       postgres    false            �            1259    16733 	   Suppliers    TABLE       CREATE TABLE public."Suppliers" (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    contact_info json,
    rating numeric(3,2) DEFAULT 0,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Suppliers";
       public         heap r       postgres    false            �            1259    16721    Users    TABLE     z  CREATE TABLE public."Users" (
    id uuid NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    role public."enum_Users_role" DEFAULT 'client'::public."enum_Users_role" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Users";
       public         heap r       postgres    false    853    853            �          0    16806 	   Favorites 
   TABLE DATA           U   COPY public."Favorites" (id, "createdAt", "updatedAt", user_id, part_id) FROM stdin;
    public               postgres    false    223   �m       �          0    16821    Inventories 
   TABLE DATA           o   COPY public."Inventories" (id, quantity, location, "createdAt", "updatedAt", part_id, supplier_id) FROM stdin;
    public               postgres    false    224   �n       �          0    16774 
   OrderItems 
   TABLE DATA           h   COPY public."OrderItems" (id, quantity, price, "createdAt", "updatedAt", order_id, part_id) FROM stdin;
    public               postgres    false    221   dp       �          0    16761    Orders 
   TABLE DATA           x   COPY public."Orders" (id, status, total_price, delivery_method, address, "createdAt", "updatedAt", user_id) FROM stdin;
    public               postgres    false    220   ^q                 0    16741    Parts 
   TABLE DATA           �   COPY public."Parts" (id, name, description, price, compatibility, stock, image, "createdAt", "updatedAt", supplier_id) FROM stdin;
    public               postgres    false    219   Kr       �          0    16789    Reviews 
   TABLE DATA           d   COPY public."Reviews" (id, rating, comment, "createdAt", "updatedAt", user_id, part_id) FROM stdin;
    public               postgres    false    222   �v       ~          0    16733 	   Suppliers 
   TABLE DATA           _   COPY public."Suppliers" (id, name, contact_info, rating, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    218   @w       }          0    16721    Users 
   TABLE DATA           `   COPY public."Users" (id, username, password, email, role, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    217   �x       �           2606    16810    Favorites Favorites_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Favorites"
    ADD CONSTRAINT "Favorites_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Favorites" DROP CONSTRAINT "Favorites_pkey";
       public                 postgres    false    223            �           2606    16826    Inventories Inventories_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Inventories"
    ADD CONSTRAINT "Inventories_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Inventories" DROP CONSTRAINT "Inventories_pkey";
       public                 postgres    false    224            �           2606    16778    OrderItems OrderItems_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."OrderItems"
    ADD CONSTRAINT "OrderItems_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."OrderItems" DROP CONSTRAINT "OrderItems_pkey";
       public                 postgres    false    221            �           2606    16768    Orders Orders_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_pkey";
       public                 postgres    false    220            �           2606    16748    Parts Parts_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Parts"
    ADD CONSTRAINT "Parts_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Parts" DROP CONSTRAINT "Parts_pkey";
       public                 postgres    false    219            �           2606    16795    Reviews Reviews_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Reviews"
    ADD CONSTRAINT "Reviews_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Reviews" DROP CONSTRAINT "Reviews_pkey";
       public                 postgres    false    222            �           2606    16740    Suppliers Suppliers_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Suppliers"
    ADD CONSTRAINT "Suppliers_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Suppliers" DROP CONSTRAINT "Suppliers_pkey";
       public                 postgres    false    218            ~           2606    19070    Users Users_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);
 C   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key";
       public                 postgres    false    217            �           2606    19072    Users Users_email_key1 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key1" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key1";
       public                 postgres    false    217            �           2606    19062    Users Users_email_key10 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key10" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key10";
       public                 postgres    false    217            �           2606    19084    Users Users_email_key11 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key11" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key11";
       public                 postgres    false    217            �           2606    19086    Users Users_email_key12 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key12" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key12";
       public                 postgres    false    217            �           2606    19088    Users Users_email_key13 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key13" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key13";
       public                 postgres    false    217            �           2606    19060    Users Users_email_key14 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key14" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key14";
       public                 postgres    false    217            �           2606    19090    Users Users_email_key15 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key15" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key15";
       public                 postgres    false    217            �           2606    19058    Users Users_email_key16 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key16" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key16";
       public                 postgres    false    217            �           2606    19092    Users Users_email_key17 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key17" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key17";
       public                 postgres    false    217            �           2606    19056    Users Users_email_key18 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key18" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key18";
       public                 postgres    false    217            �           2606    19094    Users Users_email_key19 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key19" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key19";
       public                 postgres    false    217            �           2606    19074    Users Users_email_key2 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key2" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key2";
       public                 postgres    false    217            �           2606    19054    Users Users_email_key20 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key20" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key20";
       public                 postgres    false    217            �           2606    19076    Users Users_email_key3 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key3" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key3";
       public                 postgres    false    217            �           2606    19078    Users Users_email_key4 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key4" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key4";
       public                 postgres    false    217            �           2606    19080    Users Users_email_key5 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key5" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key5";
       public                 postgres    false    217            �           2606    19068    Users Users_email_key6 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key6" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key6";
       public                 postgres    false    217            �           2606    19082    Users Users_email_key7 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key7" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key7";
       public                 postgres    false    217            �           2606    19066    Users Users_email_key8 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key8" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key8";
       public                 postgres    false    217            �           2606    19064    Users Users_email_key9 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key9" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key9";
       public                 postgres    false    217            �           2606    16728    Users Users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public                 postgres    false    217            �           2606    19026    Users Users_username_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key" UNIQUE (username);
 F   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key";
       public                 postgres    false    217            �           2606    19028    Users Users_username_key1 
   CONSTRAINT     \   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key1" UNIQUE (username);
 G   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key1";
       public                 postgres    false    217            �           2606    19018    Users Users_username_key10 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key10" UNIQUE (username);
 H   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key10";
       public                 postgres    false    217            �           2606    19040    Users Users_username_key11 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key11" UNIQUE (username);
 H   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key11";
       public                 postgres    false    217            �           2606    19042    Users Users_username_key12 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key12" UNIQUE (username);
 H   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key12";
       public                 postgres    false    217            �           2606    19044    Users Users_username_key13 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key13" UNIQUE (username);
 H   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key13";
       public                 postgres    false    217            �           2606    19016    Users Users_username_key14 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key14" UNIQUE (username);
 H   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key14";
       public                 postgres    false    217            �           2606    19046    Users Users_username_key15 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key15" UNIQUE (username);
 H   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key15";
       public                 postgres    false    217            �           2606    19014    Users Users_username_key16 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key16" UNIQUE (username);
 H   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key16";
       public                 postgres    false    217            �           2606    19048    Users Users_username_key17 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key17" UNIQUE (username);
 H   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key17";
       public                 postgres    false    217            �           2606    19012    Users Users_username_key18 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key18" UNIQUE (username);
 H   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key18";
       public                 postgres    false    217            �           2606    19050    Users Users_username_key19 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key19" UNIQUE (username);
 H   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key19";
       public                 postgres    false    217            �           2606    19030    Users Users_username_key2 
   CONSTRAINT     \   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key2" UNIQUE (username);
 G   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key2";
       public                 postgres    false    217            �           2606    19010    Users Users_username_key20 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key20" UNIQUE (username);
 H   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key20";
       public                 postgres    false    217            �           2606    19032    Users Users_username_key3 
   CONSTRAINT     \   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key3" UNIQUE (username);
 G   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key3";
       public                 postgres    false    217            �           2606    19034    Users Users_username_key4 
   CONSTRAINT     \   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key4" UNIQUE (username);
 G   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key4";
       public                 postgres    false    217            �           2606    19036    Users Users_username_key5 
   CONSTRAINT     \   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key5" UNIQUE (username);
 G   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key5";
       public                 postgres    false    217            �           2606    19024    Users Users_username_key6 
   CONSTRAINT     \   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key6" UNIQUE (username);
 G   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key6";
       public                 postgres    false    217            �           2606    19038    Users Users_username_key7 
   CONSTRAINT     \   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key7" UNIQUE (username);
 G   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key7";
       public                 postgres    false    217            �           2606    19022    Users Users_username_key8 
   CONSTRAINT     \   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key8" UNIQUE (username);
 G   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key8";
       public                 postgres    false    217            �           2606    19020    Users Users_username_key9 
   CONSTRAINT     \   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key9" UNIQUE (username);
 G   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key9";
       public                 postgres    false    217            �           1259    18573    favorites_user_id_part_id    INDEX     d   CREATE UNIQUE INDEX favorites_user_id_part_id ON public."Favorites" USING btree (user_id, part_id);
 -   DROP INDEX public.favorites_user_id_part_id;
       public                 postgres    false    223    223            �           2606    19138     Favorites Favorites_part_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Favorites"
    ADD CONSTRAINT "Favorites_part_id_fkey" FOREIGN KEY (part_id) REFERENCES public."Parts"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public."Favorites" DROP CONSTRAINT "Favorites_part_id_fkey";
       public               postgres    false    219    223    4822            �           2606    19133     Favorites Favorites_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Favorites"
    ADD CONSTRAINT "Favorites_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public."Favorites" DROP CONSTRAINT "Favorites_user_id_fkey";
       public               postgres    false    223    4776    217            �           2606    19145 $   Inventories Inventories_part_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Inventories"
    ADD CONSTRAINT "Inventories_part_id_fkey" FOREIGN KEY (part_id) REFERENCES public."Parts"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public."Inventories" DROP CONSTRAINT "Inventories_part_id_fkey";
       public               postgres    false    219    4822    224            �           2606    19150 (   Inventories Inventories_supplier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Inventories"
    ADD CONSTRAINT "Inventories_supplier_id_fkey" FOREIGN KEY (supplier_id) REFERENCES public."Suppliers"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Inventories" DROP CONSTRAINT "Inventories_supplier_id_fkey";
       public               postgres    false    224    218    4820            �           2606    19113 #   OrderItems OrderItems_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."OrderItems"
    ADD CONSTRAINT "OrderItems_order_id_fkey" FOREIGN KEY (order_id) REFERENCES public."Orders"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public."OrderItems" DROP CONSTRAINT "OrderItems_order_id_fkey";
       public               postgres    false    221    4824    220            �           2606    19118 "   OrderItems OrderItems_part_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."OrderItems"
    ADD CONSTRAINT "OrderItems_part_id_fkey" FOREIGN KEY (part_id) REFERENCES public."Parts"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public."OrderItems" DROP CONSTRAINT "OrderItems_part_id_fkey";
       public               postgres    false    4822    221    219            �           2606    19108    Orders Orders_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_user_id_fkey";
       public               postgres    false    220    4776    217            �           2606    19101    Parts Parts_supplier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Parts"
    ADD CONSTRAINT "Parts_supplier_id_fkey" FOREIGN KEY (supplier_id) REFERENCES public."Suppliers"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 J   ALTER TABLE ONLY public."Parts" DROP CONSTRAINT "Parts_supplier_id_fkey";
       public               postgres    false    219    218    4820            �           2606    19128    Reviews Reviews_part_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reviews"
    ADD CONSTRAINT "Reviews_part_id_fkey" FOREIGN KEY (part_id) REFERENCES public."Parts"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public."Reviews" DROP CONSTRAINT "Reviews_part_id_fkey";
       public               postgres    false    222    219    4822            �           2606    19123    Reviews Reviews_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reviews"
    ADD CONSTRAINT "Reviews_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public."Reviews" DROP CONSTRAINT "Reviews_user_id_fkey";
       public               postgres    false    217    4776    222            �     x��ѹm�P�:�"}@���YҼs��.�cn������LG�� ��	>֜�[��#+�'��x	�)���_��תl��7h$C��a�.�p��1{�bX�z������c�1��"ij3�m�g�]bKf[�Q�t�_(�q>!����]�>�bpt��\���{/TVY����M��lC�=Jh��WByb�F�Fo!�k�WqP��4aE�8���Y��*����@h�w�.�n�,�������-�vY���Ǻ�mۡG&�����q?BU��      �   �  x���ˍ1E����=T�������O ̆ ���@���2h��J��uN�%Bk�ܑA�����b3�F����þ�@H�y'>�N�#�
�;����h'��(=E�0y/)�s�ܸb�.}$���\,UN�:��zg�P��5z�VqC�	s̏�q~���p{?����|���-<��K�g���H�EqV˝atQ�cݴ�"�i��������K%��A��uȝ�
j�bE���Kb������v{7�ͯ���z�;�`�QN
'��3���z'�ZH]�����{B�}k���S �NR5C朗}Ky1�X��Q�����2		<�\��V;��M�ӄ�Ս�gX���L�e�qE�B� �
Nؠ�R�SB���\����{Fԙ      �   �   x���=j1��z���Z֜%�,��?B�	�e��*>��8]ai5P�k@�����x!��@̷�zq�O���I�Y�f�=�p)�3�+3q��q'h��R ��u��>Εn��@"h쇶Gj�S�E��J+�ҍzY�g�S��Ip6 ��":BeAI��̶I��Ơn��x�j�`'4�#|��j�-�
���	��BR�����\
[�N���~]�y~��w      �   �   x���;n�0К:��`���{����$#��"��H�� S��H�$�#���@Q`�u$�0I�9�~=�!zDw^���t�W��
�@ee�JՇL/(��I[%7�=NДZ�&�!Z��Y(���2h�I!�a��i��v�������*���4ƕ���|F}�$�n!�X@熰	g��[K�Zsv�8��y��#�}���h��TI5�ϟv�˲|�Sqv         U  x�m�ߊUƯ�>E��洧�N�?}�!�	�� ��?�cD֐%����Q"(ĨW�`�&��M�M^��Y�ӳf&s1C��|����"�I5ho�Z[������ɦ�7*��_䳼��B��Ñ��ͧy������~[�=ܯ��˱,���W
Q���W�C �md��;��PC,+�*�28z��E	M\A� �q,ݼ�� s�S���F[b�!&�}��q���U�GQ�O~:�5��w�Y1|-�φ�H��_��xz0?�������M��;�T\���@�
�K��#m!�7�m�ɝ[[ʑ+%��؊BE\F��w�L�V�m��r�t�CЄ@��es1�|��̋|�d&�����!=��Ky�T8��e^�f=��f������|`��X1R�����/��-��Rpn�pmWG�^��F�Hb) ��u5�a��*�����Bd��x���s<�'�2��|�� �Y�L�Ķ\@�;�U6�qe����3;Yn�%��̗X7�N�n)����Ϣo9�S��G�^����H��K�L�O㲌#;`�ۄ6�Jf@�X}|�ֽOo��������{�&�]h$�cJ�k:�c��:o�&D��:q�tK������?4h|ǣ��$N�"ؒx�{]=J\���7�ɓG��N�\q,��Sɛ����%�Ů�%�L�kI�}g�^@2���4'������P����"��4�o	�G�\I�v�g�dٳ`(jb����I��1C�������P��} ���M�=p/�邖�hu����w�U�'I�1�NE�rL%�ۤ[BH�����^ŴR��y�k[μ�W�|Ů�nm�(�u�Dc�	b�}�m�V׀����Z��C+��}�?%ϸ����Ϧ�ɏ��(���O�։O�u���N۲�TK|]��d/��7,?KA7]�$1C�cD�}��@h��2��e!�w>�{�Ѕz��g)�-��}M���p���"�S�qf��\*�:�IDIO���c�D;�!ád�;���3~}�l@hj�m�m�I�D�\O�4�X��d2 9n����r�$o��:/��9���n��t��<H���VC��^��+m+���ͥ���7˽��� y�O      �   �   x�}ɫ�0 @lOQާ<�+��؎4_��DF*-*9rMd:���AR�z���Jڄ����}�ׯ�	 ��Av0o��l�����vY��`�L��e����D���2� �݃!�ҴS2�zn��/U�5      ~   �  x�m��j�@��B��x����)9�^� ���2	$���KK�I�)�^Z补�'p>�!~��7���rH�4��Q~�gx�d�eB�h�	u=�����~�e�ã�����=���-� hSʃ�v�a��w����2^�Y���q1(�-��LE3N�;Ɓӂ���J*b�O	/(�&�8'0ʛ�Ԇ� �z�UC�B7���i�	�f�O\���q�e:�k�l�bGH�[H��Xps�O0O�n�O�?��K�O7�j����/^���x$��6����yhA�"�n3��P"8�ܽ��� u�[C�n��(N8\㤲A7*����,��0k�k:cP\�����v���~2���Ѷo����9��"��_<��t�w7���b�;�ޘǻ�k�E�x���@^1\��ط�����5@��      }   �  x�}��n�@��Y��ƞ����b@-�h@���	����Xu���	��Ԫ�;Lި(R$���wg�"�g�:L���DQ��J(�~�������?N��-b��T�z���]%��ݙ[���u�7����iĨ�F�`p+��:���8�)�"�ԪpT�0���S�0@���8 '�$��\%M��HA$TD��@�@�J6�8��}z�b�'���^DS>۝/��j�)�,'�=��!����fA������G�X'��׎h��O�"_Uf-6�� �1��б�0r��$�I�	8�2��<"�~��_���2����z,�i؄^�J>�IYv��}9�����y�]��i{�],ʃŏ�� cS����#����?��|     