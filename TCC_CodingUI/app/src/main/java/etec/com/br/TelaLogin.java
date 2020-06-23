package etec.com.br;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class TelaLogin extends AppCompatActivity {

    private Button botaoEntrar;
    private Button botaoInscrevase;
    private Button botaoEsqueceuSenha;

    private EditText editEmail;
    private EditText editSenha;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tela_login);

        editEmail = findViewById(R.id.editSenha);
        editSenha = findViewById(R.id.editSenha);

        editEmail.addTextChangedListener(EntrarSistema);
        editSenha.addTextChangedListener(EntrarSistema);

        botaoInscrevase = findViewById(R.id.btnAvancar);
        botaoInscrevase.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Inscrevase(v);
            }
        });

        botaoEntrar = findViewById(R.id.btnEntrar);
        botaoEntrar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                BtnEntrar(v);
            }
        });

        botaoEsqueceuSenha = findViewById(R.id.btnEsqueceuSenha);
        botaoEsqueceuSenha.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EsqueceuSenha(v);
            }
        });


    }

    public void BtnEntrar (View v)
    {
        if(editEmail.getText().toString().equals("123") && editSenha.getText().toString().equals("123"))
        {
            Toast.makeText(getApplication(),"Seja bem vindo "+editEmail.getText().toString()+"!",Toast.LENGTH_SHORT).show();
            Intent redirecionar = new Intent(this,TelaPrincipal.class);
            startActivity(redirecionar);
        }
        else if(!editEmail.getText().toString().equals("Etec") || !editSenha.getText().toString().equals("123"))
        {
            Toast.makeText(getApplication(),"Email ou senha inválidos",Toast.LENGTH_SHORT).show();
        }
    }

    private TextWatcher EntrarSistema = new TextWatcher() {
        @Override
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {

        }

        @Override
        public void onTextChanged(CharSequence s, int start, int before, int count) {
            String EmailInput = editEmail.getText().toString().trim();
            String SenhaInput = editSenha.getText().toString().trim();

            botaoEntrar.setEnabled(!EmailInput.isEmpty() && !SenhaInput.isEmpty());

            if (EmailInput.isEmpty() || SenhaInput.isEmpty()){
                botaoEntrar.setBackground(getResources().getDrawable(R.drawable.btndisable));
                botaoEntrar.setTextColor(getResources().getColor(R.color.colorHint));
            } else {
                botaoEntrar.setBackground(getResources().getDrawable(R.drawable.arredondarbuttoncadastrar));
                botaoEntrar.setTextColor(getResources().getColor(R.color.colorFontCoding));
            }
        }

        @Override
        public void afterTextChanged(Editable s) {

        }
    };

    public void Inscrevase (View v)
    {
        Intent redirecionar = new Intent(this,TelaCadastro.class);
        startActivity(redirecionar);
    }

    public void EsqueceuSenha (View v)
    {
        Intent redirecionar = new Intent(this,RedefSenha.class);
        startActivity(redirecionar);
    }
}
