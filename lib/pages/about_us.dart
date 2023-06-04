// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    //final List<Testimonial> testimonials = [
    // Testimonial('John Smith',
    // 'I have been using Product A for the past year and I am extremely satisfied with it. The customer support is excellent and the product itself is top-quality. I highly recommend it to anyone in need of a reliable and efficient solution.'),
    // Testimonial('Jane Doe',
    // 'I was skeptical about Product B at first, but after using it for a few weeks I am pleasantly surprised. It is easy to use and customize, and it has saved me a lot of time and effort. I will definitely be using it again in the future.'),
    // Testimonial('Bob Johnson',
    // 'Product C exceeded my expectations. Not only is it energy efficient, but it is also environmentally friendly. I feel good about using it and will be recommending it to my friends and family.'),
    //];

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          //Name and Logo
          Container(
            width: screenWidth,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'NEW SHANTIKA',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Image.asset(
                  'lib/images/shantika_logo.png',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ),

          //brief summary
          Container(
              width: screenWidth,
              padding: const EdgeInsets.all(8),
              child: Text(
                'Di manapun Anda berada, kami ada untuk membantu Anda.',
                style: Theme.of(context).textTheme.bodyMedium,
              )),

          //statement and values
          Container(
              width: screenWidth,
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Misi:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Misi kami adalah untuk menyediakan produk dan layanan berkualitas tinggi kepada pelanggan kami.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Values:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  const ListTile(
                    leading: Icon(Icons.check),
                    title: Text('Kepuasan pelanggan adalah prioritas kami'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.check),
                    title: Text(
                        'Kami berusaha untuk selalu memperbaiki produk dan layanan kami'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.check),
                    title: Text(
                        'Kami selalu mengedepankan kejujuran dan integritas dalam semua tindakan'),
                  ),
                ],
              )),

          //History and background
          Container(
              width: screenWidth,
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fasilitas:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  const ListTile(
                    leading: Icon(Icons.ac_unit),
                    title: Text('AC di setiap bus'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.electric_bolt_sharp),
                    title: Text('Terminal Listrik'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.tv),
                    title: Text('Televisi'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.chat_bubble),
                    title: Text('Customer service yang ramah'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.airline_seat_recline_extra),
                    title: Text('Suasana yang nyaman'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.emoji_food_beverage_rounded),
                    title: Text('Snack yang beragam '),
                  ),
                  const ListTile(
                    leading: Icon(Icons.event_available),
                    title: Text('Jadwal yang selalu tepat waktu'),
                  ),
                ],
              )),

          //products or service
          //  Container(
          //      width: screenWidth,
          //       padding: EdgeInsets.all(8),
          //      child: Column(
          //        crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'Products:',
          //             style: Theme.of(context).textTheme.titleLarge,
          //           ),
          //           SizedBox(height: 8),
          //           ListTile(
          //             leading: Icon(Icons.check),
          //             title: Text('Product A: High-quality and durable'),
          // ),
          // ListTile(
          // leading: Icon(Icons.check),
          // title: Text('Product B: Easy to use and customize'),
          // ),
          // ListTile(
          // leading: Icon(Icons.check),
          // title: Text(
          // 'Product C: Energy efficient and environmentally friendly'),
          // ),
          // ],
          // )),

          //awards
          Container(
              width: screenWidth,
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tentang Kami',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Achmad Rizky'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Luthfan Ramdhan Wahyudi'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Muhammad Abdurrahman Firdaus'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Muhammad Alfarizqi Rabbani'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Rizal Rafif Setiawan'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Ryan David Siahaan'),
                  ),
                ],
              )),

          //Testimonials or reviews
          //Container(
          //  width: screenWidth,
          //  padding: EdgeInsets.all(8),
          //  child: Text(
          //    'Testimonials:',
          //    style: Theme.of(context).textTheme.headline6,
          //   ),
          //),
          // Container(
          //  width: screenWidth,
          //  padding: EdgeInsets.all(8),
          // child: ListView.builder(
          //  shrinkWrap: true,
          //  itemCount: testimonials.length,
          //  itemBuilder: (context, index) {
          //   return Card(
          //     child: Padding(
          //      padding: EdgeInsets.all(8.0),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             testimonials[index].author,
          //             style: Theme.of(context).textTheme.subtitle1,
          //           ),
          //           SizedBox(height: 4),
          //            Text(
          //             testimonials[index].text,
          //             style: Theme.of(context).textTheme.bodyText2,
          //           ),
          //         ],
          //       ),
          //     ),
          //   );
          //  },
          //),
          // ),

          //contact information
          Container(
              width: screenWidth,
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hubungi Kami',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  const ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(
                        'Jl. Telekomunikasi. 1, Terusan Buahbatu - Bojongsoang'),
                    subtitle: Text(
                        'Sukapura, Kec. Dayeuhkolot, Kabupaten Bandung, Jawa Barat 40257'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('(+62) 851-5726-0088 (Hanya melayani chat)'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.email),
                    title: Text('Newshantika.livery@gmail.com'),
                  ),
                ],
              )),

          //social media
          Container(
              width: screenWidth,
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Follow Us:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    leading: const Icon(Icons.link),
                    title: const Text('Facebook'),
                    onTap: () => launchUrl(Uri.parse(
                        'https://m.facebook.com/newshantika.official')),
                  ),
                  ListTile(
                    leading: const Icon(Icons.link),
                    title: const Text('Instagram'),
                    onTap: () => launchUrl(Uri.parse(
                        'https://www.instagram.com/newshantika.official')),
                  ),
                  ListTile(
                    leading: const Icon(Icons.link),
                    title: const Text('Youtube'),
                    onTap: () => launchUrl(Uri.parse(
                        'https://www.youtube.com/c/NewShantikaChannel')),
                  ),
                ],
              )),
        ],
      ),
    ));
  }
}

class Testimonial {
  final String author;
  final String text;

  Testimonial(this.author, this.text);
}
