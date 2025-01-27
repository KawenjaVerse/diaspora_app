import 'package:flutter/material.dart';

class AboutUgandaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'About Uganda',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: const Color(0xFFFF5C23),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'About Uganda',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFF5C23),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                '''
        History and Political Situation
        Uganda gained her independence on October 9th 1962 having been a British Protectorate since 1894 that was put together from some very organized kingdoms and chieftaincies that inhabited the lake regions of East Africa. At independence, Dr. Milton Apollo Obote, also leader of the Uganda People's Congress (UPC) became the first Prime Minister and head of the government.
        
        In November 1963, Kabaka Mutesa II King of Buganda was elected ceremonial President of Uganda.
        
        Obote suspended the 1962 constitution on 22nd February 1966 and took over all powers of State, thus giving rise to what came to be known as the 1966 Crisis. Amongst other things, the federal constitutional status of kingdoms was abolished and the office of Prime Minister merged with that of the President and all executive powers became vested in Obote. Uganda was declared a Republic.
        
        In 1967 Obote abolished all monarchs and later all political parties were outlawed, except UPC. In a move to the left, Uganda became a one-party-state.
        
        It was against this background that Idi Amin led a disgruntled section of the army to overthrow Obote on 25th January 1971. This coup was met with great jubilation but was to begin an era of terror and enormous tribulation for the people of Uganda. This dark period would last 8 long years. It was also during this period that all Asians, mainly Indians, were expelled from Uganda. As a result, the economy of Uganda suffered tremendously. The fiscal mismanagement and insecurity that followed didn’t help the situation.
        
        An estimated 300,000 Ugandans lost their lives through indiscriminate extra judicial killings during Idi Amin's regime.
        
        In April 1979, a combined force of Ugandan exiles, under the umbrella of Uganda National Liberation Army (UNLF), and the Tanzania Peoples Defense Force (TPDF) overthrew Amin's regime. The UNLF was created through the patronage of President Nyerere of Tanzania at the Moshi Conference. It brought together a disparate group of Ugandan organizations and individuals with a common goal of ousting the Amin regime. The first UNLF government was led by Prof. Yusuf Lule as President and though well liked, only lasted 68 days.
        
        President Lule was followed by President Godfrey Binaisa, and then Paulo Muwanga who chaired the ruling Military Commission which organized the December 1980 general elections. UPC was declared winner of those elections though they were marred by multiple irregularities and generally considered rigged. For a second time, Obote became President of Uganda.
        
        During Obote's second tenure as president, Ugandans went through a very trying period. Insecurity, fuelled by the government's own security organs as well as an ongoing liberation struggle devastated the country. An estimated 500,000 Ugandans lost their lives in just 5 years of Obote's reign. The economy was shattered and so was the people's faith in government.
        
        In direct protest against the marred elections of 1980, Yoweri Kaguta Museveni, then Vice Chairman of the Military Commission and President of the Uganda Patriotic Movement, launched a liberation struggle. As the NRA made staggering advances towards Kampala, having already cut the country off into two different administrative zones, elements of the UNLA on July 26th 1985 ousted Obote in a bid to find better negotiating ground. The Military Junta of Generals Bazilio and Tito Okello replaced Obote II's government.
        
        By February 26th 1986 the "Okellos Junta" had fallen and shortly after the entire country was under control of the NRA. The NRA's struggle was unique in that, for the first time in post-colonial Africa, a home-grown insurgency, with no rear bases in a neighbouring country and little external support, was ultimately successful. It was essentially an uprising of oppressed Ugandan citizens.
        
        The arduous task of rebuilding the entire country and its human fabric from scratch began. To enable this task, political parties were suspended and Uganda was governed by an all-inclusive Movement system. A lot was to be achieved over the next eight to ten years.
        
        The NRA/M however continued to face the challenge of reactionary UNLA forces especially in the northern part of the country.
        
        In 1995, a new constitution was promulgated creating a non-party all-inclusive Movement System of government. Under this system, political parties remained in abeyance. Elections to most political offices was by universal suffrage. Marginalized groups like the women, the disabled, the youth and workers were given special slots on all administrative units of Government. The military was also given representation in parliament. The aspect of keeping this system was to be reviewed by referendum every 4 years.
        
        General elections were held in 1996 under the Movement System and Yoweri Museveni was returned as President of Uganda. By this election, he became the very first Ugandan to be directly elected to the post by universal suffrage. In 2001, he was again returned by popular mandate to the Office of President
        
        In July 2005 a national referendum was held in which the people of Uganda resolved to return to multi-party politics. The result of the referendum in effect marked an end to the Movement System of government. On February 23rd 2006, multi-party elections were held for both the office of president and for parliament. President Yoweri Museveni of the National Resistance Movement (NRM) won the presidential elections and the NRM took the highest number of seats in parliament. He was re-elected in 2011, 2016 and 2021.
        ''',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
             
            ],
          ),
        ),
      ),
    );
  }
}